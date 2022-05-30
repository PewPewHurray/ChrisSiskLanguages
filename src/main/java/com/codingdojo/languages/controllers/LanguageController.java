package com.codingdojo.languages.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

@Controller
public class LanguageController {
	@Autowired
	LanguageService languageService;
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/languages";
	}
	
	@GetMapping("/languages")
	public String languages(@ModelAttribute("language") Language language, Model model) {
		model.addAttribute("languages", languageService.allLanguages());
		return "index.jsp";
	}
	
	@PostMapping("/languages/create")
	public String createLanguage(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("languages", languageService.allLanguages());
			return "index.jsp";
		}
		languageService.createLanguage(language);
		return "redirect:/languages";
	}
	
	@GetMapping("/languages/{id}")
	public String viewLanguage(@PathVariable Long id, Model model) {
		model.addAttribute("language", languageService.findLanguage(id));
		return "view.jsp";
	}
	
	@GetMapping("/languages/{id}/edit")
	public String editLangauage(@PathVariable Long id, Model model) {
		model.addAttribute("language", languageService.findLanguage(id));
		return "edit.jsp";
	}
	
	@PutMapping("/languages/{id}/update")
	public String updateLanguage(@PathVariable Long id, @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("language", languageService.findLanguage(id));
			return "edit.jsp";
		}
		languageService.editLanguage(language);
		return "redirect:/languages";
	}
	
	@DeleteMapping("/languages/{id}/destroy")
	public String destroyLanguage(@PathVariable Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
}
