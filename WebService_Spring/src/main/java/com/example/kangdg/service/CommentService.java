package com.example.kangdg.service;

import com.example.kangdg.DTO.CommentDto;
import com.example.kangdg.entity.Article;
import com.example.kangdg.entity.Comment;
import com.example.kangdg.repository.ArticleRepository;
import com.example.kangdg.repository.CommentRepository;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private ArticleRepository articleRepository;

    public List<CommentDto> comments(Long articleId) {
   /*     // 조회 : 댓글 목록
        List<Comment> comments = commentRepository.findByArticleId(articleId);

        // 변환 : 엔티티 -> DTO
        List<CommentDto> dtos = new ArrayList<CommentDto>();
        for (int i =0; i < comments.size(); i++){
            Comment c = comments.get(i);
            CommentDto dto = CommentDto.createCommentDto(c);
            dtos.add(dto);
        }

        // 반환*/
        //return dtos;

        return commentRepository.findByArticleId(articleId)
                .stream()
                .map(comment -> CommentDto.createCommentDto(comment))
                .collect(Collectors.toList());
    }

    @Transactional
    public CommentDto create(Long articleId, CommentDto dto) {
        log.info("입력값 ==> {}", articleId);
        log.info("입력값 ==> {}", dto);
        //게시글 조회 및 예외 처리
        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new IllegalArgumentException("댓글 생성 실패! 대상 게시글이 없습니다.!"));

        //댓글 엔티티 생성
        Comment comment = Comment.createComment(dto, article);

        //댓글 엔티티를 DB로 저장
        Comment created = commentRepository.save(comment);

        //DTO를 변경하여 변환
//        return CommentDto.createCommentDto(created);
        CommentDto createDto = CommentDto.createCommentDto(created);
        log.info("입력값 ==> {}", createDto);
        return createDto;
    }
    @Transactional //데이터 건드리면 롤백 되게 트랜젝션 선언
    public CommentDto update(Long id, CommentDto dto) {
        //댓글 조회 및 예외 발생
        Comment target = commentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("댓글 수정 실패 대상 댓글이 없습니다."));

        //댓글 수정
        target.patch(dto);

        //DB로 갱신
        Comment updated = commentRepository.save(target);

        //댓글 엔티티를 DTO로 변환 및 반환
        return CommentDto.createCommentDto(updated);

    }

    @Transactional
    public CommentDto delete(Long id) {
        //댓글조회 (및 예외 발생)
        Comment target = commentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException(("댓글 삭제 실패! 대상이 없습니다.")));

        //댓글 삭제
        commentRepository.delete(target);

        //삭제 댓글을 DTO로 변환
        return CommentDto.createCommentDto(target);
    }
}
