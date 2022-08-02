package com.example.kangdg.service;

import com.example.kangdg.entity.Article;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest //해당 클래스는 스프링부트와 연동되어 테스팅 된다.
class ArticleServiceTest {
    @Autowired ArticleService articleService;

    @Test
    void index() {
        //예상
        Article a = new Article(1L, "가가가가", "1111");
        Article b = new Article(2L, "나나나나", "2222");
        Article c = new Article(3L, "다다다다", "3333");
        List<Article> expcted = new ArrayList<Article>(Arrays.asList(a, b, c));
        //실제
        List<Article> articles = articleService.index();

        //비교
        assertEquals(expcted.toString(), articles.toString());
    }

    @Test
    void show_success() {
    }

    @Test
    void show_failed() {
    }
}

// @Transactional 는 메소드 끝난 후 롤백이됨
// (create, delete 테스트 후 롤백 하여 운영데이터에 문제를 주면 안됨)