import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.WriteConcern;
import com.mongodb.util.JSON;

public class BookSearcher {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("검색어를 입력 하세요?");
		Scanner sc = new Scanner(System.in);
		String search = sc.next();

		BookSearcher bs = new BookSearcher();
		String sql = bs.searchBooks(search);
		bs.saveBooks(sql);
	}

	// 도서검색
	public String searchBooks(String keyword) {

		URL url = null;

		try {

			url = new URL("https://www.googleapis.com/books/v1/volumes?q=" + keyword);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		StringBuffer sb = new StringBuffer();
		String line;

		try {

			URLConnection urlConn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(), "utf-8"));
			while ((line = br.readLine()) != null)
				sb.append(line + "\n");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	// 도서 검색 결과에서 items찾아와 저장한다
	public void saveBooks(String books) {

		Mongo mongo = null;

		try {
			mongo = new Mongo("localhost", 27017);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

		// 몽고디비 db는 books-db 이고 컬렉션은 books 로 만들어짐
		mongo.setWriteConcern(new WriteConcern(1, 2000));
//		DB bookDB = mongo.getDB("books-db");
		DB bookDB = mongo.getDB("local");
		DBCollection bookColl = bookDB.getCollection("books");

		try {

			JSONObject json = new JSONObject(books);
			JSONArray items = json.getJSONArray("items");

			for (int i = 0; i < items.length(); i++) {
				DBObject doc = new BasicDBObject();

				// search-book key로 value가 들어간다
				doc.put("search-book", (DBObject) JSON.parse(items.getJSONObject(i).toString()));
				bookColl.save(doc);
			}

		} catch (JSONException e) {
			e.printStackTrace();
		}

	}

}
