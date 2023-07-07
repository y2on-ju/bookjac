package com.example.bookjac.service;

import com.example.bookjac.domain.Member;
import com.example.bookjac.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService {

    @Autowired
    private MemberMapper mapper;

    public boolean signup(Member member) {
            int cnt = mapper.insert(member);
            return cnt == 1;
    }

    public List<Member> listMember() {

        return mapper.selectAll();
    }

    public Member get(String id) {

        return mapper.selectById(id);
    }

    public boolean remove(Member member) {
        Member oldMember = mapper.selectById(member.getId());
        int cnt = 0;
        if(oldMember.getPassword().equals(member.getPassword())) {
            // 암호가 같으면?
            cnt = mapper.deleteById(member.getId());

        }
        return cnt == 1;
    }

    public boolean modify(Member member) {
        mapper.update(member);
        return false;
    }
}