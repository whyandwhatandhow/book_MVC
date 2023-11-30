import com.ymd.pojo.Books;
import com.ymd.service.BookService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    @Test
    public void Test(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("springmvc-servlet.xml");
        BookService bookServiceImpl = (BookService) context.getBean("bookServiceImpl");
        for (Books books : bookServiceImpl.queryAllBooks()) {
            System.out.println(books);
        }

    }
}


