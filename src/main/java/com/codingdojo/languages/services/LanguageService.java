package com.codingdojo.languages.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	public List<Language> allLanguages(){
		return languageRepository.findAll();
	}
	
	public Language createLanguage(Language l) {
		return languageRepository.save(l);
	}
	
	public Language editLanguage(Language l) {
		return languageRepository.save(l);
	}
	
	public Language findLanguage(Long id) {
		return languageRepository.findById(id).orElse(null);
	}
	
	public void deleteLanguage(Long id) {
		languageRepository.deleteById(id);
	}
}
