package com.example.kangdg.controller;

import com.example.kangdg.DTO.ArticleForm;
import com.example.kangdg.DTO.CommentDto;
import com.example.kangdg.entity.Article;
import com.example.kangdg.repository.ArticleRepository;
import com.example.kangdg.service.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class ArticleController {

    @Autowired //스프링 부트가 미리 생성해놓은 객체를 가져다가 자동 연결
    private ArticleRepository articleRepository;

    @Autowired
    private CommentService commentService;

    @GetMapping("/articles/new")
    public String newArticleForm(){
        return "articles/new";
    }

    @PostMapping("/articles/create")
    public String createrArticle(ArticleForm form){
        log.info(form.toString());

        //1. DTO를 Entiy 로 변환!
        Article article = form.toEntity();
        //System.out.println(article.toString()); -> logging으로 대체
        log.info(article.toString());


        //2. Repository Entity를 DB안에 저장하게 함!
        Article saved = articleRepository.save(article);
        //System.out.println(saved.toString());
        log.info(saved.toString());
        return "redirect:/articles/" + saved.getId();
    }

    @GetMapping("/articles/{id}")
    public String show(@PathVariable Long id, Model model){
        log.info("id= " + id);

        // 1: id로 데이터를 가져옴!
        Article articleEntity = articleRepository.findById(id).orElse(null);
        List<CommentDto> commentDtos = commentService.comments(id);

        // 2: 기져온 데이터를 모델에 등록!
        model.addAttribute("article",articleEntity);
        model.addAttribute("commentDtos", commentDtos);
        // 3: 보여줄 페이지를 설정
       return "articles/show";
    }
    @GetMapping("/articles")
    public String index(Model model){
        //1. 모든 아티클을 가져온다
        List<Article> articleEntityList = articleRepository.findAll();

        //2. 가져온 Articles 묶음을 뷰로 전단!
        model.addAttribute("articleList",articleEntityList);

        //3. 뷰 페이지를 설정!
        return "articles/index";
    }

    @GetMapping("/articles/{id}/edit")
    public String edit(@PathVariable Long id, Model model){
        //수정할 데이터를 가져오기
        Article articleEntity = articleRepository.findById(id).orElse(null);

        //모델에 데이터를 등록
        model.addAttribute("article",articleEntity);


        // 뷰페이지 설정
        return "articles/edit";
    }
    @PostMapping("/articles/update")
    public String update(ArticleForm form){
        log.info(form.toString());

        //1. DTO를 entity로 변환
        Article artitleEntity = form.toEntity();
        log.info(artitleEntity.toString());

        //2. entity를 db로 저장
            //2-1 db에서 데이터를 가져온다.
            Article target = articleRepository.findById(artitleEntity.getId()).orElse(null);
            //2-2 기존 데이터에서 갱신
            if(target != null){
                articleRepository.save(artitleEntity);
            }
        //3. 수정 결과 페이지로 라이렉트
        return "redirect:/articles/" + artitleEntity.getId();
    }

    @GetMapping("/articles/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes rttr){
        //PathVariable 은 Getmapping 에서의 id 와 같은 의미 라는것을 말하기 위함.
        log.info("삭제 요청이 들어왔습니다.");

        //1. 삭제 대상을 가져옴
        Article target= articleRepository.findById(id).orElse(null);
        //2. 대상을 삭제
        if (target != null){
            log.info(target.toString());
            articleRepository.delete(target);
            rttr.addFlashAttribute("msg","Delete Complete");
        }
        //3. 결과 페이지로 리다이렉트
        return "/articles";
    }
}
