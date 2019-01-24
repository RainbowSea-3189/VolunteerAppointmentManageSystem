-- Create table
create table APPOINTMENT_RECORD
(
  ID               VARCHAR2(11) not null,
  NAME             NVARCHAR2(50),
  DEP_ID           VARCHAR2(11),
  DEP_NAME         NVARCHAR2(100),
  PHONE            NVARCHAR2(50),
  STATION_ID       VARCHAR2(11) not null,
  APPOINTMENT_TIME DATE,
  BEGIN_TIME       DATE,
  END_TIME         DATE,
  INSERTER         NVARCHAR2(50),
  INSERT_TIME      DATE,
  UPDATEER         NVARCHAR2(50),
  UPDATE_TIME      DATE,
  WX_USER_ID       VARCHAR2(50),
  STATUS           NUMBER(2) default 0
)
-- Add comments to the table 
comment on table APPOINTMENT_RECORD
  is '志愿者岗位预约记录表';
-- Add comments to the columns 
comment on column APPOINTMENT_RECORD.ID
  is '主键ID';
comment on column APPOINTMENT_RECORD.NAME
  is '预约人姓名';
comment on column APPOINTMENT_RECORD.DEP_ID
  is '预约人部门ID';
comment on column APPOINTMENT_RECORD.DEP_NAME
  is '预约人部门名称';
comment on column APPOINTMENT_RECORD.PHONE
  is '预约人电话';
comment on column APPOINTMENT_RECORD.STATION_ID
  is '预约岗位ID';
comment on column APPOINTMENT_RECORD.APPOINTMENT_TIME
  is '预约日期';
comment on column APPOINTMENT_RECORD.BEGIN_TIME
  is '预约开始时间';
comment on column APPOINTMENT_RECORD.END_TIME
  is '预约结束时间';
comment on column APPOINTMENT_RECORD.WX_USER_ID
  is '企业微信ID';
comment on column APPOINTMENT_RECORD.STATUS
  is '状态，0：已预约，1：已签到，2：已完成，3：未完成';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPOINTMENT_RECORD
  add primary key (ID);

-- Create sequence 
create sequence APPOINTMENT_RECORD_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 182
increment by 1
nocache;

-- Create table
create table RECORD_INFO
(
  ID          NUMBER(11) not null,
  PHONE       NVARCHAR2(50) not null,
  APPO_ID     VARCHAR2(11) not null,
  STATION_ID  VARCHAR2(11) not null,
  APPO_DATE   DATE,
  TIME_FRAME  NUMBER(11) not null,
  INSERTER    NVARCHAR2(50),
  INSERT_TIME DATE
)
-- Add comments to the table 
comment on table RECORD_INFO
  is '预约记录详情表';
-- Add comments to the columns 
comment on column RECORD_INFO.ID
  is '主键ID';
comment on column RECORD_INFO.PHONE
  is '预约人电话';
comment on column RECORD_INFO.APPO_ID
  is '预约记录ID：关联记录表';
comment on column RECORD_INFO.STATION_ID
  is '岗位ID：关联岗位表';
comment on column RECORD_INFO.APPO_DATE
  is '预约日期';
comment on column RECORD_INFO.TIME_FRAME
  is '预约时段';
-- Create/Recreate primary, unique and foreign key constraints 
alter table RECORD_INFO
  add primary key (ID);

  -- Create sequence 
create sequence RECORD_INFO_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 219
increment by 1
nocache;

CREATE OR REPLACE TRIGGER record_info_tri BEFORE
   INSERT ON record_info FOR EACH ROW 
when (new.id is null)
begin
     select record_info_seq.nextval into:new.id from dual;
  end;


  create table STATION
(
  ID          VARCHAR2(11) not null,
  NAME        NVARCHAR2(50) not null,
  DETAILS     NVARCHAR2(500),
  NUM         NUMBER(11),
  SORT        NUMBER(11),
  INSERTER    NVARCHAR2(50),
  INSERT_TIME DATE,
  UPDATEER    NVARCHAR2(50),
  UPDATE_TIME DATE
)
-- Add comments to the table 
comment on table STATION
  is '志愿者岗位表';
-- Add comments to the columns 
comment on column STATION.ID
  is '主键ID';
comment on column STATION.NAME
  is '岗位名称';
comment on column STATION.DETAILS
  is '岗位描述';
comment on column STATION.NUM
  is '岗位人数';
comment on column STATION.SORT
  is '岗位类别';
-- Create/Recreate primary, unique and foreign key constraints 
alter table STATION
  add primary key (ID);

  -- Create sequence 
create sequence STATION_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 5
increment by 1
nocache;

CREATE OR REPLACE TRIGGER station_tri BEFORE
   INSERT ON station FOR EACH ROW 
when (new.id is null)
begin
     select station_seq.nextval into:new.id from dual;
  end;
