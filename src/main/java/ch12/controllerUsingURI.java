package ch12;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*@WebServlet("/bbb")*/
public class controllerUsingURI extends HttpServlet {
// <커맨드, 핸들러인스턴스> 매핑 정보 저장
private Map<String, CommandHandler> CommandHandlerMap =
        new HashMap<>();
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init");
		String configFile = getInitParameter("configFile");
		System.out.println(configFile);
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		try(FileReader fis = new FileReader(configFilePath)) {
			
			prop.load(fis);
		}catch (IOException e) {
			throw new ServletException(e);
		}
		System.out.println(prop);
		Iterator keyIter = prop.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);
			
			try {
			Class<?> handlerClass = Class.forName(handlerClassName);
			CommandHandler handlerInstance = 
					(CommandHandler) handlerClass.newInstance();
			CommandHandlerMap.put(command,handlerInstance);
		}catch(InstantiationException e) {
			e.printStackTrace();
		}catch(IllegalAccessException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();	
	}}	
		super.init();
	System.out.println(CommandHandlerMap);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doget");
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
