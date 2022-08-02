package com.example.kangdg.entity;

import com.example.kangdg.DTO.CommentDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;

@Entity
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne //해당 댓글 엔티티 여러개가, 하나의 Article에 연결된다
    @JoinColumn(name = "article_id")
    private Article article;

    @Column
    private String nickname;

    @Column
    private String body;

    public static Comment createComment(CommentDto dto, Article article) {
        if(dto.getId() != null){
            throw new IllegalArgumentException("댓글 생성 실패!");
        }
         if(dto.getArticleId() != article.getId()){
             log.info(dto.getArticleId().toString() + article.getId().toString());
            throw new IllegalArgumentException("댓글 생성 실패! 게시글의 id가 잘못되었습니다");
        }
        return new Comment(
                dto.getId(),
                article,
                dto.getNickname(),
                dto.getBody());
    }

    public void patch(CommentDto dto) {
        //예외 발생
        if(this.id != dto.getId())
            throw new IllegalArgumentException("댓글 수정 실패 잘못된 id가 입력되었습니다");

        //객체 갱신
        if(dto.getNickname() != null)
            this.nickname = dto.getNickname();
        if(dto.getBody() != null)
            this.body = dto.getBody();
    }
}
