package br.com.docket.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.docket.model.Cartorio;

@Controller
public class CartorioController {
	
	@RequestMapping(value = "/cartorio", method = RequestMethod.GET) 
	 public ModelAndView cliente() {
	  return new ModelAndView("cartorio", "command", new Cartorio());
	 }
	 
	 @RequestMapping(value = "/addCartorio", method = RequestMethod.POST)
	 public String adicionarCartorio(
	  @ModelAttribute("SpringWeb") Cartorio cartorio, ModelMap model, 
	  HttpServletRequest request) {
	         
	   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	         
	 
	   model.addAttribute("nome", cartorio.getNome());


	         
	 
	   List<Cartorio> cartorios = (List<Cartorio>) 
	   request.getSession().getAttribute("cartorios");
	   if (cartorios == null) {
	      cartorios = new ArrayList<Cartorio>();
	   } 
	   cartorios.add(cartorio);
	   request.getSession().setAttribute("cartorios", cartorios);
	         
	   return "exibeCartorio";
	}
	     
	    @RequestMapping(value = "/listaCartorios", method = RequestMethod.GET)
	    public String listarCartorios(
	  @ModelAttribute("SpringWeb") ModelMap model, HttpServletRequest request) {
	         
	    List<Cartorio> cartorios = (List<Cartorio>) 
	    request.getAttribute("cartorios");
	         
	    model.addAttribute("cartorios", cartorios);   
	         
	    return "listaCartorios";
	   }
	}
