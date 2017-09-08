<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
${list.NOTICE_NUM } / ${list.TITLE } / ${list.CONTENT} / ${list.NOTICE_DATE } / ${list.TARGET } / ${list.TARGETS }

<a href="/admin/management/notice/notice_modify.ja?num=${list.NOTICE_NUM }">수정</a>
<a href="/admin/management/notice/notice_del.ja?num=${list.NOTICE_NUM }">삭제</a>