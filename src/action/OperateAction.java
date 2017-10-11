package action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import mysqlcon.SqlCon;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

class Book{
	public String ISBN;
	public String Title;
	public int AuthorID;
	public String Publisher;
	public String PublishDate;
	public double Prices;
}

class Author{
	public int AuthorID;
	public String Name;
	public int Age;
	public String Country;
}

public class OperateAction extends ActionSupport{
	private String AuthorName;
    private int AuthorID=-1;
    private int AuthorAge;
    private String AuthorCountry;
    private String ISBN;
    private String Title;
    private int BookAuthorID;
    private String Publisher;
    private String PublishDate;
    private double Prices;
    private String result;
    
    public String newBook() {
    	if(getAuthorID()!=-1 && getAuthorID()!=getBookAuthorID()) {
    		result="differ";
    		return "success";
    	}
        SqlCon authorQuery=new SqlCon();
        String queryAuthor="select * from author where AuthorID=\'" + getBookAuthorID()+"\'";
        ResultSet authorQueryRet=authorQuery.executeQuery(queryAuthor);
        try {
			if(authorQueryRet.next()) {
				SqlCon bookAdd=new SqlCon();
				String queryISBN="select * from book where ISBN=\'" + getISBN()+"\'";
		        ResultSet tmpRet=bookAdd.executeQuery(queryISBN);
		        if(tmpRet.next()) {
		        	result="bookexist";
		        }else {
		        	String addBook="insert into book " +
							"(ISBN,Title,AuthorID,Publisher,PublishDate,Prices) " +
							"values('" + getISBN() + "','" + getTitle() +
							"','" + getBookAuthorID() + "','" + getPublisher() +
							"','" + getPublishDate() + "','" + getPrices() + "')";
		        	bookAdd.executeUpdate(addBook);
		        	result="addbook";
		        }
				bookAdd.closeCon();
			}else if(getAuthorID()==-1){
				result="noauthor";
			}else {
				SqlCon bookAdd=new SqlCon();
				String queryISBN="select * from book where ISBN=\'" + getISBN()+"\'";
		        ResultSet tmpRet=bookAdd.executeQuery(queryISBN);
		        if(tmpRet.next()) {
		        	result="bookexist";
		        }else {
		        	String addBook="insert into book " +
							"(ISBN,Title,AuthorID,Publisher,PublishDate,Prices) " +
							"values('" + getISBN() + "','" + getTitle() +
							"','" + getBookAuthorID() + "','" + getPublisher() +
							"','" + getPublishDate() + "','" + getPrices() + "')";
		        	bookAdd.executeUpdate(addBook);
		        	SqlCon authorAdd=new SqlCon();
					String addAuthor="insert into author " +
									 "(AuthorID,Name,Age,Country) " +
									 "values('" + getAuthorID() + "','" + getAuthorName() + 
									 "','" + getAuthorAge() + "','" + getAuthorCountry() +  "')";
					authorAdd.executeUpdate(addAuthor);
					authorAdd.closeCon();
					result="addbookandauthor";
		        }
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        authorQuery.closeCon();
    	return "success";
    }

    public String queryISBN() {
    	SqlCon query=new SqlCon();
    	String ISBNquery="select * from book where ISBN=\'" + getISBN()+"\'";
    	ResultSet rs=query.executeQuery(ISBNquery);
    	try {
			if(rs.next()) {
				JSONObject log = new JSONObject();
				log.put("ISBN", rs.getString("ISBN"));
				log.put("Title", rs.getString("Title"));
				log.put("AuthorID", rs.getInt("AuthorID"));
				log.put("Publisher", rs.getString("Publisher"));
				log.put("PublishDate", rs.getString("PublishDate"));
				log.put("Prices", rs.getDouble("Prices"));
				Map<String,Object> map=new HashMap<String,Object>();
	        	map.put("book", log);
	        	JSONObject json = JSONObject.fromObject(map);
	        	result=json.toString();
			}else {
				result="noexist";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	query.closeCon();
    	return "success";
    }
    
    public String updateBook() {
    	if(getAuthorID()!=-1 && getAuthorID()!=getBookAuthorID()) {
    		result="differ";
    		return "success";
    	}
        SqlCon authorQuery=new SqlCon();
        String queryAuthor="select * from author where AuthorID=\'" + getBookAuthorID()+"\'";
        ResultSet authorQueryRet=authorQuery.executeQuery(queryAuthor);
        try {
			if(authorQueryRet.next()) {
				SqlCon bookAdd=new SqlCon();
				String addBook="update book set " + "Title='" + getTitle() +
								"',AuthorID='" + getBookAuthorID() + "',Publisher='" +
								getPublisher() + "',PublishDate='" + getPublishDate() + 
								"',Prices='" + getPrices() + "' where ISBN='" + getISBN() +
								"'";
				bookAdd.executeUpdate(addBook);
				bookAdd.closeCon();
				result="updatebook";
			}else if(getAuthorID()==-1){
				result="noauthor";
			}else {
				SqlCon bookAdd=new SqlCon();
				String addBook="update book set " + "Title='" + getTitle() +
								"',AuthorID='" + getBookAuthorID() + "',Publisher='" +
								getPublisher() + "',PublishDate='" + getPublishDate() + 
								"',Prices='" + getPrices() + "' where ISBN='" + getISBN() +
								"'";
				bookAdd.executeUpdate(addBook);
				bookAdd.closeCon();
				SqlCon authorAdd=new SqlCon();
				String addAuthor="insert into author " +
								 "(AuthorID,Name,Age,Country) " +
								 "values('" + getAuthorID() + "','" + getAuthorName() + 
								 "','" + getAuthorAge() + "','" + getAuthorCountry() +  "')";
				authorAdd.executeUpdate(addAuthor);
				authorAdd.closeCon();
				result="updatebookandaddauthor";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        authorQuery.closeCon();
    	return "success";
    }
    
    public String queryAuthorBook() {
    	int flag=0;
        HttpServletRequest request = ServletActionContext.getRequest();
        if(getAuthorName().equals("")) {
        	request.setAttribute("queryRet", "empty");
        	return "success";
        }
        SqlCon authorSqlCon = new SqlCon();
        String queryAuthor = "select * from author where Name=\'" + getAuthorName()+"\'";
        ResultSet authorRS=authorSqlCon.executeQuery(queryAuthor);
        List<Book> bookList = new ArrayList<Book>();
	    try {
			if(!authorRS.next()) {
				request.setAttribute("queryRet", "noauthor");
				authorSqlCon.closeCon();
				return "success";
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        try {
			authorRS.beforeFirst();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        try {
			while(authorRS.next()) {
				SqlCon bookSqlCon=new SqlCon();
				String queryBook="select * from book where AuthorID=\'" + authorRS.getInt("AuthorID") + "\'";
				ResultSet bookRS=bookSqlCon.executeQuery(queryBook);
				while(bookRS.next()) {
					flag=1;
					Book tmpBook=new Book();
					tmpBook.ISBN=bookRS.getString("ISBN");
					tmpBook.Title=bookRS.getString("Title");
					tmpBook.AuthorID=bookRS.getInt("AuthorID");
					tmpBook.Publisher=bookRS.getString("Publisher");
					tmpBook.PublishDate=bookRS.getString("PublishDate");
					tmpBook.Prices=bookRS.getDouble("Prices");
					bookList.add(tmpBook);
				}
				bookSqlCon.closeCon();
			}
			authorSqlCon.closeCon();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        if(flag==0) {
        	request.setAttribute("queryRet", "nobook");
        	return "success";
        }else {
        	request.setAttribute("bookList", bookList);
        	request.setAttribute("queryRet", "success");
        	request.setAttribute("authorName", getAuthorName());
        	return "success";
        }
    }
    
    public String deleteBook() {
    	SqlCon bookDelete=new SqlCon();
    	String deleteBook = "delete from book where ISBN=\'" + getISBN() + "\'";
    	bookDelete.executeUpdate(deleteBook);
    	bookDelete.closeCon();
    	return queryAuthorBook();
    }
    
    public String queryBookDetail() {
    	Map<String,Object> map=new HashMap<String,Object>();
    	SqlCon bookDetail=new SqlCon();
    	String queryBookDetail = "select * from book where ISBN=\'" + getISBN()+"\'";
    	ResultSet bookRS=bookDetail.executeQuery(queryBookDetail);
    	try {
			bookRS.next();
			JSONObject log = new JSONObject();
			log.put("ISBN", bookRS.getString("ISBN"));
			log.put("Title", bookRS.getString("Title"));
			log.put("AuthorID", bookRS.getInt("AuthorID"));
			log.put("Publisher", bookRS.getString("Publisher"));
			log.put("PublishDate", bookRS.getString("PublishDate"));
			log.put("Prices", bookRS.getDouble("Prices"));
			map.put("book", log);
			bookDetail.closeCon();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	SqlCon authorDetail=new SqlCon();
    	String queryAuthorDetail="select * from author where AuthorID=\'" + getAuthorID()+"\'";
    	ResultSet authorRS=authorDetail.executeQuery(queryAuthorDetail);
    	try {
			authorRS.next();
			JSONObject log = new JSONObject();
			log.put("AuthorID", authorRS.getInt("AuthorID"));
			log.put("AuthorName", authorRS.getString("Name"));
			log.put("AuthorAge", authorRS.getInt("Age"));
			log.put("AuthorCountry", authorRS.getString("Country"));
			map.put("author", log);
			authorDetail.closeCon();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	JSONObject json = JSONObject.fromObject(map);
    	result=json.toString();
    	return "success";
    }
    
    public String editBook() {
        HttpServletRequest request = ServletActionContext.getRequest();
		SqlCon bookSqlCon=new SqlCon();
		String queryBook="select * from book where ISBN=\'" + getISBN() + "\'";
		ResultSet bookRS=bookSqlCon.executeQuery(queryBook);
		try {
			bookRS.next();
			request.setAttribute("ISBN", bookRS.getString("ISBN"));
			request.setAttribute("Title", bookRS.getString("Title"));
			request.setAttribute("AuthorID", bookRS.getInt("AuthorID"));
			request.setAttribute("Publisher", bookRS.getString("Publisher"));
			request.setAttribute("PublishDate", bookRS.getString("PublishDate"));
			request.setAttribute("Prices", bookRS.getDouble("Prices"));
			request.setAttribute("queryRet", "success");
			bookSqlCon.closeCon();
		} catch (SQLException e) {
			request.setAttribute("queryRet", "fail");
			e.printStackTrace();
		}
    	return "success";
    }
    
	public String getAuthorName() {
		return AuthorName;
	}

	public void setAuthorName(String authorName) {
		AuthorName = authorName;
	}

	public int getAuthorID() {
		return AuthorID;
	}

	public void setAuthorID(int authorID) {
		AuthorID = authorID;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getPublisher() {
		return Publisher;
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}

	public String getPublishDate() {
		return PublishDate;
	}

	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	public double getPrices() {
		return Prices;
	}

	public void setPrices(double prices) {
		Prices = prices;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getBookAuthorID() {
		return BookAuthorID;
	}

	public void setBookAuthorID(int bookAuthorID) {
		BookAuthorID = bookAuthorID;
	}

	public int getAuthorAge() {
		return AuthorAge;
	}

	public void setAuthorAge(int authorAge) {
		AuthorAge = authorAge;
	}

	public String getAuthorCountry() {
		return AuthorCountry;
	}

	public void setAuthorCountry(String authorCountry) {
		AuthorCountry = authorCountry;
	}
}
