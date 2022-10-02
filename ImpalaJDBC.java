import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ImpalaJDBC {

	// Parameters
	static String CONNECTION_URL = "<IMPALA_JDBC_URL>"; // ex: jdbc:impala://<host>:443/default;AuthMech=3;transportMode=http;httpPath=cliservice;UID=<your_username>;PWD=<your_password>;
	static String QUERY = "<IMPALA_QUERY>";

	/**
	 * Main method
	 *
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			// establish connection
			String DRIVER_CLASS = "com.cloudera.impala.jdbc.Driver";
			Connection connection = null;
			Class.forName(DRIVER_CLASS);
			connection = DriverManager.getConnection(CONNECTION_URL);

			// execute query
			execQry(connection);

			// close connection
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Execute Query
	 *
	 * @param connection
	 */
	public static void execQry(Connection connection) {
		try {
			// execute query
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(QUERY);

			// print output
			System.out.println("Impala test ------- ");
			while (rs.next()) {
				// print 1st column values
				System.out.println(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Wait method to test queries after intervals for troubleshooting
	 *
	 * @param ms
	 */
	public static void wait(int ms) {
		try {
			Thread.sleep(ms);
		} catch (InterruptedException e) {
			System.err.format("IOException: %s%n", e);
		}
	}

}
