import com.mongodb.Mongo;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class MongoConnect {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("local");

			DBCollection dbcol = db.getCollection("books");
			DBCursor cursor = dbcol.find();

			while (cursor.hasNext()) {
				DBObject result = cursor.next();
				System.out.println(result);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
