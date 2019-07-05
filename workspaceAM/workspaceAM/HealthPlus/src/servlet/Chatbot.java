package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.watson.developer_cloud.conversation.v1.Conversation;
import com.ibm.watson.developer_cloud.conversation.v1.model.InputData;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageRequest;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;


@WebServlet("/Chatbot")
public class Chatbot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ArrayList<String> conversa = new ArrayList<String>();
	
    public Chatbot() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MessageResponse resp= null;
		Map context = new HashMap();
		
		String pergunta = request.getParameter("pergunta");
		resp= conversationAPI(pergunta,context);		
		String resposta = resp.getOutput().getText().get(0);
		context = resp.getContext();
		
		//Este é um teste para armazenar a conversa
				
		String cliente = "<p class='perg'>"+pergunta+"</p>";
		String watson =  "<p class='resp'>"+resposta+"</p>";
		conversa.add(cliente);
		conversa.add(watson);
		
		
		
		request.setAttribute("conversa", conversa);
		
		//request.setAttribute("resposta", resposta);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	public static MessageResponse conversationAPI(String input, Map context){
		Conversation service = new Conversation("2018-08-21");
		service.setUsernameAndPassword("cf879014-f9b7-486c-8596-f54c0669da1e", "MAubPUe8FSjF");
		InputData inputData = new InputData.Builder().text(input).build();
		MessageRequest newMessage = new MessageRequest();
		newMessage.setInput(inputData);
		String workspaceId = "65993d3d-7726-46dd-afa7-77443dac66ba";
		MessageOptions options = new MessageOptions.Builder(workspaceId).input(inputData).build();
		MessageResponse response = service. message(options).execute();
		return response;
		
	}
}
