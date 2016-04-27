--PL/SQL for part 1
	--Conditions
BEGIN
IF :Type = 'President' THEN
    RETURN TRUE;
ELSE
    RETURN FALSE;
END IF;
END;

BEGIN
   IF :Type = 'President' THEN
       RETURN TRUE;
   ELSE
      IF :Type = 'Manager' THEN
          RETURN TRUE;
      ELSE
          RETURN FALSE;
      END IF;
   END IF;
END;

BEGIN
   IF :Type = 'President' THEN
       RETURN TRUE;
   ELSE
      IF :Type = 'Manager' THEN
          RETURN TRUE;
      ELSE
          RETURN FALSE;
      END IF;
   END IF;
END;

--PL/SQL for part 2
	--Default query 
		"from person Retrieve *;"
		"from employee Retrieve *;"
		"from department Retrieve *;"
		"from project Retrieve *;"
	--Sources
		--for Person
			select				
				jt1.first_name	first_name,			
				jt2.last_name	last_name,			
				jt3.person_id	person_id,			
				jt4.home_address	home_address,			
				jt5.zipcode	zipcode,			
				jt6.home_phone	home_phone,			
				jt7.us_citizen	us_citizen
				from	apex_collections	t,
				json_table(t.clob001, '$.first_name[*]' COLUMNS rid for ordinality, first_name varchar path '$') jt1,
				json_table(t.clob001, '$.last_name[*]' COLUMNS rid for ordinality, last_name varchar path '$') jt2,
				json_table(t.clob001, '$.person_id[*]' COLUMNS rid for ordinality, person_id varchar path '$') jt3,
				json_table(t.clob001, '$.home_address[*]' COLUMNS rid for ordinality, home_address varchar path '$') jt4,
				json_table(t.clob001, '$.zipcode[*]' COLUMNS rid for ordinality, zipcode varchar path '$') jt5,
				json_table(t.clob001, '$.home_phone[*]' COLUMNS rid for ordinality, home_phone varchar path '$') jt6,
				json_table(t.clob001, '$.us_citizen[*]' COLUMNS rid for ordinality, us_citizen varchar path '$') jt7
				where	t.collection_name	=	'P2_PERSONJSON'and 
				jt1.rid = jt2.rid and jt2.rid = jt3.rid and jt3.rid = jt4.rid and jt4.rid = jt5.rid and jt5.rid = jt6.rid and jt6.rid = jt7.rid
		--for Department
			select
			jt1.dept_no deptno,
			jt2.dept_name deptname
			from apex_collections t,
			json_table(t.clob001, '$.dept_no[*]' COLUMNS rid for ordinality, dept_no varchar path '$') jt1,
			json_table(t.clob001, '$.dept_name[*]' COLUMNS rid for ordinality, dept_name varchar path '$') jt2
			where t.collection_name = 'P3_DEPARTMENTJSON' and jt1.rid = jt2.rid
		--for Employee
			Same as Person
		--for Project
			select
			jt1.project_no projectno,
			jt2.project_title projectitle
			from apex_collections t,
			json_table(t.clob001, '$.project_no[*]' COLUMNS rid for ordinality, project_no varchar path '$') jt1,
			json_table(t.clob001, '$.project_title[*]' COLUMNS rid for ordinality, project_title varchar path '$') jt2
			where t.collection_name = 'P6_PROJECT_JSON' and jt1.rid = jt2.rid


	