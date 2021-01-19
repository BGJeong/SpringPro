package com.home.pro.Controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.home.pro.DTO.memberDTO;
import com.home.pro.service.MemberServiceImpl;

@Controller
public class AccountController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	@Autowired
	private MemberServiceImpl service;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@RequestMapping(value="retire.do")
	public String retire() {
		return "retire";
	}
	
	@RequestMapping(value="retireAction.do", method=RequestMethod.POST)
	public String retireAction(String passwd, 
							HttpSession session) {
		String userid = (String) session.getAttribute("id");
		memberDTO dto = service.findpwd(userid);
		if(!dto.getPasswd().equals(passwd)) {
			return "deleteResult";
		} else {
			String filePath = session.getServletContext().getRealPath("upload");
			String file_name = dto.getProfile_img();
			logger.info(filePath);
			
			if(file_name != null) {
				File userFile = new File(filePath);
				File[] f = userFile.listFiles();
				for(int i=0; i<f.length; i++) {
					if(f[i].getName().equals(file_name)) {
						f[i].delete();
					}
				}
			}
			service.deleteMember(userid);
			session.invalidate();
		}
		return "redirect:login.do";
	}
	
	@RequestMapping(value = "/edit_ok.do", method = RequestMethod.POST)
	public String edit_ok(@RequestParam("profile") MultipartFile mf, memberDTO dto, HttpServletRequest request,
			HttpSession session, Model model) throws Exception {
		logger.info("�뙆�씪 �씠由� : "+mf.getOriginalFilename());
		logger.info("而⑦뀗�듃 ���엯 : " +mf.getContentType());		
		logger.info("�떎�젣 �뙆�씪 寃쎈줈 : " +request.getRealPath("upload"));
		String filename = mf.getOriginalFilename();
		int index = filename.lastIndexOf(".");
		String fileName = filename.substring(0, index); 
		String fileExt = filename.substring(index + 1);

		int size = (int) mf.getSize();

		String path = request.getRealPath("upload");
		int result = 0;
		String file[] = new String[2];

		if (filename != "") { // 泥⑤��뙆�씪�씠 �쟾�넚�맂 寃쎌슦

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken(); // �솗�옣�옄

			if (size > 1000000) {
				result = 1;
				model.addAttribute("result", result);

				return "uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png") && !file[1].equals("JPG") && !file[1].equals("JPEG") && !file[1].equals("jpeg")) {

				result = 2;
				model.addAttribute("result", result);

				return "uploadResult";
			}

		}
		UUID uuid = UUID.randomUUID();
		String newFileName = uuid.toString()+"_"+filename;
		logger.info("newFileName : " + newFileName );
		File newfile = new File(path + "/" + newFileName);
		logger.info("newfile : "+newfile);
		if (size > 0) { // 泥⑤��뙆�씪�씠 �쟾�넚�맂 寃쎌슦
			mf.transferTo(newfile);
		}
		String filePath = path+ "\\" + newFileName;
		logger.info("filePath : "+filePath);
		
		BufferedImage Img = ImageIO.read(new File(filePath));
		int dw = 200, dh = 200; 
		// �썝蹂� �씠誘몄��쓽 �꼫鍮꾩� �넂�씠 �엯�땲�떎. 
		int ow = Img.getWidth(); 
		int oh = Img.getHeight(); 
		// �썝蹂� �꼫鍮꾨�� 湲곗��쑝濡� �븯�뿬 �뜽�꽕�씪�쓽 鍮꾩쑉濡� �넂�씠瑜� 怨꾩궛�빀�땲�떎. 
		int nw = ow; int nh = (ow * dh) / dw; 
		// 怨꾩궛�맂 �넂�씠媛� �썝蹂몃낫�떎 �넂�떎硫� crop�씠 �븞�릺誘�濡� 
		// �썝蹂� �넂�씠瑜� 湲곗��쑝濡� �뜽�꽕�씪�쓽 鍮꾩쑉濡� �꼫鍮꾨�� 怨꾩궛�빀�땲�떎. 
		if(nh > oh) { 
			nw = (oh * dw) / dh; nh = oh; 
		}

		BufferedImage croped = Scalr.crop(Img, (ow-nw)/2, (oh-nh)/2, nw, nh);
		BufferedImage reImg = Scalr.resize(croped, dw, dh);
		
		String thumbName = path+"\\"+uuid.toString()+"_THUMB_"+fileName+"."+fileExt;
		logger.info("thumbName : "+thumbName);
		File thumbFile = new File(thumbName);
		ImageIO.write(reImg, fileExt, thumbFile);
		
		String id = (String)session.getAttribute("id");
		memberDTO mem = service.findpwd(id);
		if(size > 0){
			dto.setProfile_img(uuid.toString()+"_THUMB_"+fileName+"."+fileExt);
		} else {
			dto.setProfile_img(mem.getProfile_img());
		}
		dto.setUserid(id);
		
		service.edit(dto);
		session.setAttribute("pimg", dto.getProfile_img());
		return "redirect:mypage.do";
	}

	@RequestMapping(value = "/edit.do")
	public String edit(HttpSession session, Model model) {
		String userid = "";
		if (session.getAttribute("id") != null) {
			userid = (String) session.getAttribute("id");
		} else {
			logger.info("濡쒓렇�씤 �븞�맖");
		}
		memberDTO dto = service.findpwd(userid);
		model.addAttribute("dto", dto);
		return "edit";
	}

	@RequestMapping(value = "/home.do")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/find_pwd.do")
	public String find_pwd() {
		return "find_pwd";
	}

	@RequestMapping(value = "find_pwd_ok.do")
	public String find_pwd_ok(@RequestParam("id") String id, Model model) {
		memberDTO dto = service.findpwd(id);
		if (dto == null) {
			model.addAttribute("pass", -1);
			return "find_pwd_result";
		} else {
			model.addAttribute("id", dto.getUserid());
			model.addAttribute("pass", dto.getPasswd());
			return "find_pwd";
		}
	}

	@RequestMapping(value = "/login.do")
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}

	@RequestMapping(value = "/mypage.do")
	public String mypage(HttpSession session, Model model) {
		String id = "";
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		} else {
			logger.info("濡쒓렇�씤�븞�맖");
			id = "err";
		}
		memberDTO dto = service.findpwd(id);
		model.addAttribute("dto", dto);
		return "mypage";
	}

	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		session.invalidate();
		return "redirect:index.jsp";
	}

	// 占쎄퐬占쎌뵠甕곤옙 嚥≪뮄�젃占쎌뵥 占쎄쉐�⑤벊�뻻 callback占쎌깈�빊占� 筌롫뗄�꺖占쎈굡
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 嚥≪뮄�젃占쎌뵥 占쎄텢占쎌뒠占쎌쁽 占쎌젟癰귣�占쏙옙 占쎌뵭占쎈선占쎌궔占쎈뼄.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		logger.info(apiResult);
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 占쎈쑓占쎌뵠占쎄숲 占쎈솁占쎈뼓
		// Top占쎌쟿甕곤옙 占쎈뼊�⑨옙 _response 占쎈솁占쎈뼓
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response占쎌벥 nickname揶쏉옙 占쎈솁占쎈뼓
		String nickname = (String) response_obj.get("name");
		String email = (String) response_obj.get("eamil");
		System.out.println(nickname);
		System.out.println(email);
		// 4.占쎈솁占쎈뼓 占쎈빏占쎄퐬占쎌뿫 占쎄쉭占쎈�∽옙�몵嚥∽옙 占쏙옙占쎌삢
		session.setAttribute("id", nickname); // 占쎄쉭占쎈�� 占쎄문占쎄쉐
		session.setAttribute("email", email);
		model.addAttribute("result", apiResult);

		/* 占쎄퐬占쎌뵠甕곤옙 嚥≪뮄�젃占쎌뵥 占쎄쉐�⑨옙 占쎈읂占쎌뵠筌욑옙 View 占쎌깈�빊占� */
		return "home";
	}

	@RequestMapping(value = "/header.do")
	public String header() {
		return "header";
	}

	@RequestMapping(value = "/loginAction.do", method = RequestMethod.POST)
	public String loginAction(String userid, String passwd, Model model, HttpSession session) throws Exception {
		logger.info(userid);
		int result = 0;
		memberDTO dto = service.login(userid);
		if (dto == null) {
			result = 1;
			logger.info("dto=null");
			model.addAttribute("result", result);
			return "loginResult";
		} else {
			if (dto.getPasswd().equals(passwd)) {
				logger.info("id : " + dto.getUserid());
				logger.info("pass : "+dto.getPasswd());
				session.setAttribute("id", userid);
				session.setAttribute("pimg", dto.getProfile_img());
				session.setAttribute("dto", dto);
				return "home";
			} else {
				result = 1;
				model.addAttribute("result", result);
				return "loginResult";
			}
		}
	}

	@RequestMapping(value="/search.do")
	public String search(){
		return "search";
	}
	@RequestMapping(value = "/join.do")
	public String join() {
		return "join";
	}

	@RequestMapping(value = "/joinAction.do", method = RequestMethod.POST)
	public String joinAction(@ModelAttribute("dto") memberDTO dto) throws Exception {

		service.insert(dto);

		return "login";
	}

	@RequestMapping(value = "idcheck.do")
	public String idcheck(@RequestParam("username") String id, Model model) {
		int result = service.idcheck(id);
		model.addAttribute("result", result);
		return "idcheckresult";
	}
	@RequestMapping(value="searchAction.do")
	@ResponseBody
	public ArrayList<memberDTO> searchAction(@RequestParam("search") String search, Model model){
		ArrayList<memberDTO> list = service.searchAction(search);
		
		return list;
	}
	@RequestMapping(value="follow.do")
	@ResponseBody
	public int follow(@RequestParam("fid") String target_id, Model model, HttpSession session) throws Exception{
		int result = 0;
		String mem_id = (String)session.getAttribute("id");
		Map<String, String> map = new HashMap<String, String>();
		map.put("target_id", target_id);
		map.put("mem_id", mem_id);
		result = service.follow(map);
		logger.info("result : "+result );
		return result;
	}
	
	@RequestMapping(value="userView.do", method=RequestMethod.GET)
	public String userView(@RequestParam("uid") String uid, Model model){
		logger.info(uid);	
		memberDTO dto = service.findpwd(uid);
		model.addAttribute("userdto", dto);
		return "userView";
	}
	
}
