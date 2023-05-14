package com.seba.languages.controllers;

import com.seba.languages.models.Language;
import com.seba.languages.services.LanguageService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class LanguageController {
    private final LanguageService languageService;

    public LanguageController(LanguageService languageService) {
        this.languageService = languageService;
    }

    @RequestMapping("/")
    public String home(){
        return "redirect:/languages";
    }

    @RequestMapping("/languages")
    public String index(@ModelAttribute("language") Language language, Model model){
        List<Language> languages = languageService.allLanguage();
        model.addAttribute("langs", languages);
        return "/languages/index.jsp";
    }


    @RequestMapping(value = "/languages", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("language") Language language, BindingResult result){
        if (result.hasErrors()){
            return "/languages/index.jsp";
        }else{
            languageService.createLanguage(language);
            return "redirect:/languages";
        }
    }

    @RequestMapping("/languages/{id}")
    public String show(@PathVariable Long id, Model model){
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "/languages/show.jsp";
    }

    @RequestMapping(value = "/languages/{id}", method = RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id){
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }

    @RequestMapping(value = "/languages/edit/{id}", method = RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result){
        if (result.hasErrors()){
            return "/languages/edit.jsp";
        }else{
            languageService.updateLanguage(language);
            return "redirect:/languages";
        }
    }

    @RequestMapping("/languages/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "/languages/edit.jsp";
    }

}
