package cn.zhang.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TOrderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TOrderExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameIsNull() {
            addCriterion("doctor_realname is null");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameIsNotNull() {
            addCriterion("doctor_realname is not null");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameEqualTo(String value) {
            addCriterion("doctor_realname =", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameNotEqualTo(String value) {
            addCriterion("doctor_realname <>", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameGreaterThan(String value) {
            addCriterion("doctor_realname >", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameGreaterThanOrEqualTo(String value) {
            addCriterion("doctor_realname >=", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameLessThan(String value) {
            addCriterion("doctor_realname <", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameLessThanOrEqualTo(String value) {
            addCriterion("doctor_realname <=", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameLike(String value) {
            addCriterion("doctor_realname like", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameNotLike(String value) {
            addCriterion("doctor_realname not like", value, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameIn(List<String> values) {
            addCriterion("doctor_realname in", values, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameNotIn(List<String> values) {
            addCriterion("doctor_realname not in", values, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameBetween(String value1, String value2) {
            addCriterion("doctor_realname between", value1, value2, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andDoctorRealnameNotBetween(String value1, String value2) {
            addCriterion("doctor_realname not between", value1, value2, "doctorRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameIsNull() {
            addCriterion("user_realname is null");
            return (Criteria) this;
        }

        public Criteria andUserRealnameIsNotNull() {
            addCriterion("user_realname is not null");
            return (Criteria) this;
        }

        public Criteria andUserRealnameEqualTo(String value) {
            addCriterion("user_realname =", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameNotEqualTo(String value) {
            addCriterion("user_realname <>", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameGreaterThan(String value) {
            addCriterion("user_realname >", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameGreaterThanOrEqualTo(String value) {
            addCriterion("user_realname >=", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameLessThan(String value) {
            addCriterion("user_realname <", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameLessThanOrEqualTo(String value) {
            addCriterion("user_realname <=", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameLike(String value) {
            addCriterion("user_realname like", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameNotLike(String value) {
            addCriterion("user_realname not like", value, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameIn(List<String> values) {
            addCriterion("user_realname in", values, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameNotIn(List<String> values) {
            addCriterion("user_realname not in", values, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameBetween(String value1, String value2) {
            addCriterion("user_realname between", value1, value2, "userRealname");
            return (Criteria) this;
        }

        public Criteria andUserRealnameNotBetween(String value1, String value2) {
            addCriterion("user_realname not between", value1, value2, "userRealname");
            return (Criteria) this;
        }

        public Criteria andOrderDateIsNull() {
            addCriterion("order_date is null");
            return (Criteria) this;
        }

        public Criteria andOrderDateIsNotNull() {
            addCriterion("order_date is not null");
            return (Criteria) this;
        }

        public Criteria andOrderDateEqualTo(Date value) {
            addCriterion("order_date =", value, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateNotEqualTo(Date value) {
            addCriterion("order_date <>", value, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateGreaterThan(Date value) {
            addCriterion("order_date >", value, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateGreaterThanOrEqualTo(Date value) {
            addCriterion("order_date >=", value, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateLessThan(Date value) {
            addCriterion("order_date <", value, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateLessThanOrEqualTo(Date value) {
            addCriterion("order_date <=", value, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateIn(List<Date> values) {
            addCriterion("order_date in", values, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateNotIn(List<Date> values) {
            addCriterion("order_date not in", values, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateBetween(Date value1, Date value2) {
            addCriterion("order_date between", value1, value2, "orderDate");
            return (Criteria) this;
        }

        public Criteria andOrderDateNotBetween(Date value1, Date value2) {
            addCriterion("order_date not between", value1, value2, "orderDate");
            return (Criteria) this;
        }

        public Criteria andUserTelIsNull() {
            addCriterion("user_tel is null");
            return (Criteria) this;
        }

        public Criteria andUserTelIsNotNull() {
            addCriterion("user_tel is not null");
            return (Criteria) this;
        }

        public Criteria andUserTelEqualTo(String value) {
            addCriterion("user_tel =", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelNotEqualTo(String value) {
            addCriterion("user_tel <>", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelGreaterThan(String value) {
            addCriterion("user_tel >", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelGreaterThanOrEqualTo(String value) {
            addCriterion("user_tel >=", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelLessThan(String value) {
            addCriterion("user_tel <", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelLessThanOrEqualTo(String value) {
            addCriterion("user_tel <=", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelLike(String value) {
            addCriterion("user_tel like", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelNotLike(String value) {
            addCriterion("user_tel not like", value, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelIn(List<String> values) {
            addCriterion("user_tel in", values, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelNotIn(List<String> values) {
            addCriterion("user_tel not in", values, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelBetween(String value1, String value2) {
            addCriterion("user_tel between", value1, value2, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserTelNotBetween(String value1, String value2) {
            addCriterion("user_tel not between", value1, value2, "userTel");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdIsNull() {
            addCriterion("doctor_id is null");
            return (Criteria) this;
        }

        public Criteria andDoctorIdIsNotNull() {
            addCriterion("doctor_id is not null");
            return (Criteria) this;
        }

        public Criteria andDoctorIdEqualTo(Long value) {
            addCriterion("doctor_id =", value, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdNotEqualTo(Long value) {
            addCriterion("doctor_id <>", value, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdGreaterThan(Long value) {
            addCriterion("doctor_id >", value, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdGreaterThanOrEqualTo(Long value) {
            addCriterion("doctor_id >=", value, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdLessThan(Long value) {
            addCriterion("doctor_id <", value, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdLessThanOrEqualTo(Long value) {
            addCriterion("doctor_id <=", value, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdIn(List<Long> values) {
            addCriterion("doctor_id in", values, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdNotIn(List<Long> values) {
            addCriterion("doctor_id not in", values, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdBetween(Long value1, Long value2) {
            addCriterion("doctor_id between", value1, value2, "doctorId");
            return (Criteria) this;
        }

        public Criteria andDoctorIdNotBetween(Long value1, Long value2) {
            addCriterion("doctor_id not between", value1, value2, "doctorId");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(Integer value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(Integer value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(Integer value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(Integer value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(Integer value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<Integer> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<Integer> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(Integer value1, Integer value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(Integer value1, Integer value2) {
            addCriterion("state not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNull() {
            addCriterion("created is null");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNotNull() {
            addCriterion("created is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedEqualTo(Date value) {
            addCriterion("created =", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotEqualTo(Date value) {
            addCriterion("created <>", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThan(Date value) {
            addCriterion("created >", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThanOrEqualTo(Date value) {
            addCriterion("created >=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThan(Date value) {
            addCriterion("created <", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThanOrEqualTo(Date value) {
            addCriterion("created <=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedIn(List<Date> values) {
            addCriterion("created in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotIn(List<Date> values) {
            addCriterion("created not in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedBetween(Date value1, Date value2) {
            addCriterion("created between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotBetween(Date value1, Date value2) {
            addCriterion("created not between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andDoctorTelIsNull() {
            addCriterion("doctor_tel is null");
            return (Criteria) this;
        }

        public Criteria andDoctorTelIsNotNull() {
            addCriterion("doctor_tel is not null");
            return (Criteria) this;
        }

        public Criteria andDoctorTelEqualTo(String value) {
            addCriterion("doctor_tel =", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelNotEqualTo(String value) {
            addCriterion("doctor_tel <>", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelGreaterThan(String value) {
            addCriterion("doctor_tel >", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelGreaterThanOrEqualTo(String value) {
            addCriterion("doctor_tel >=", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelLessThan(String value) {
            addCriterion("doctor_tel <", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelLessThanOrEqualTo(String value) {
            addCriterion("doctor_tel <=", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelLike(String value) {
            addCriterion("doctor_tel like", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelNotLike(String value) {
            addCriterion("doctor_tel not like", value, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelIn(List<String> values) {
            addCriterion("doctor_tel in", values, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelNotIn(List<String> values) {
            addCriterion("doctor_tel not in", values, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelBetween(String value1, String value2) {
            addCriterion("doctor_tel between", value1, value2, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andDoctorTelNotBetween(String value1, String value2) {
            addCriterion("doctor_tel not between", value1, value2, "doctorTel");
            return (Criteria) this;
        }

        public Criteria andVisitStateIsNull() {
            addCriterion("visit_state is null");
            return (Criteria) this;
        }

        public Criteria andVisitStateIsNotNull() {
            addCriterion("visit_state is not null");
            return (Criteria) this;
        }

        public Criteria andVisitStateEqualTo(Integer value) {
            addCriterion("visit_state =", value, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateNotEqualTo(Integer value) {
            addCriterion("visit_state <>", value, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateGreaterThan(Integer value) {
            addCriterion("visit_state >", value, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("visit_state >=", value, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateLessThan(Integer value) {
            addCriterion("visit_state <", value, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateLessThanOrEqualTo(Integer value) {
            addCriterion("visit_state <=", value, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateIn(List<Integer> values) {
            addCriterion("visit_state in", values, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateNotIn(List<Integer> values) {
            addCriterion("visit_state not in", values, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateBetween(Integer value1, Integer value2) {
            addCriterion("visit_state between", value1, value2, "visitState");
            return (Criteria) this;
        }

        public Criteria andVisitStateNotBetween(Integer value1, Integer value2) {
            addCriterion("visit_state not between", value1, value2, "visitState");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageIsNull() {
            addCriterion("doctor_message is null");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageIsNotNull() {
            addCriterion("doctor_message is not null");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageEqualTo(String value) {
            addCriterion("doctor_message =", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageNotEqualTo(String value) {
            addCriterion("doctor_message <>", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageGreaterThan(String value) {
            addCriterion("doctor_message >", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageGreaterThanOrEqualTo(String value) {
            addCriterion("doctor_message >=", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageLessThan(String value) {
            addCriterion("doctor_message <", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageLessThanOrEqualTo(String value) {
            addCriterion("doctor_message <=", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageLike(String value) {
            addCriterion("doctor_message like", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageNotLike(String value) {
            addCriterion("doctor_message not like", value, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageIn(List<String> values) {
            addCriterion("doctor_message in", values, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageNotIn(List<String> values) {
            addCriterion("doctor_message not in", values, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageBetween(String value1, String value2) {
            addCriterion("doctor_message between", value1, value2, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andDoctorMessageNotBetween(String value1, String value2) {
            addCriterion("doctor_message not between", value1, value2, "doctorMessage");
            return (Criteria) this;
        }

        public Criteria andHistoryStateIsNull() {
            addCriterion("history_state is null");
            return (Criteria) this;
        }

        public Criteria andHistoryStateIsNotNull() {
            addCriterion("history_state is not null");
            return (Criteria) this;
        }

        public Criteria andHistoryStateEqualTo(Boolean value) {
            addCriterion("history_state =", value, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateNotEqualTo(Boolean value) {
            addCriterion("history_state <>", value, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateGreaterThan(Boolean value) {
            addCriterion("history_state >", value, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateGreaterThanOrEqualTo(Boolean value) {
            addCriterion("history_state >=", value, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateLessThan(Boolean value) {
            addCriterion("history_state <", value, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateLessThanOrEqualTo(Boolean value) {
            addCriterion("history_state <=", value, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateIn(List<Boolean> values) {
            addCriterion("history_state in", values, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateNotIn(List<Boolean> values) {
            addCriterion("history_state not in", values, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateBetween(Boolean value1, Boolean value2) {
            addCriterion("history_state between", value1, value2, "historyState");
            return (Criteria) this;
        }

        public Criteria andHistoryStateNotBetween(Boolean value1, Boolean value2) {
            addCriterion("history_state not between", value1, value2, "historyState");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}