package com.example.sys.common;


public interface Constant {

    /**
     * 状态码
     */
    public static final Integer OK = 200;
    public static final Integer ERROR = -1;

    /**
     * 用户默认密码
     */
    public static final String USER_DEFAULT_PWD = "123456";

    /**
     * 菜单权限类型
     */
    public static final String TYPE_MENU = "menu";
    public static final String TYPE_PERMISSION = "permission";
    /**
     * 可以状态
     */
    public static final Object AVAILABLE_TRUE = 1;
    public static final Object AVAILABLE_FALSE = 0;

    public static final Object IS_DELETED = 1;
    public static final Object NOT_DELETED = 0;
    /**
     * 用户类型
     */
    public static final Integer USER_TYPE_SUPER = 0;//超级管理员
    public static final Integer USER_TYPE_HOSPITAL_ADMIN = 1; //医院管理员
    public static final Integer USER_TYPE_HOSPITAL_DOCTOR = 2; //医院医生
    public static final Integer USER_TYPE_HOSPITAL_BEAUTICION = 3; //医院洗美师
    public static final Integer USER_TYPE_NORMAL = 4; //普通用户


    /**
     * 挂号类型
     */
    public static final Integer APPLY_TYPE_OUTPATIENT = 11;//门诊
    public static final Integer APPLY_TYPE_STERILIZATION = 12;//绝育
    public static final Integer APPLY_TYPE_VACCINE = 13;//疫苗
    public static final Integer APPLY_TYPE_BATH = 21;//洗澡
	public static final Integer APPLY_TYPE_TOOTH_CLEANING = 22;//洗牙
	public static final Integer APPLY_TYPE_BEAUTY = 23;//美容
	public static final Integer APPLY_TYPE_OTHER = 24;//其它

    /**
     * 展开类型
     */
    public static final Integer OPEN_TRUE = 1;
    public static final Integer OPEN_FALSE = 0;


    /**
     * 用户类型
     */
    public static final Integer USER_TYPE_SUPERADMIN = 1;
    public static final Integer USER_TYPE_DOCTOR = 2;
    public static final Integer USER_TYPE_BEAUTICIAN = 3;
    public static final Integer USER_TYPE_CUSTMOR = 4;

    /**
     * 商品默认图片
     */
    public static final String IMAGES_DEFAULTGOODSIMG_PNG = "images/defaultgoodsimg.png";


    public static final Integer TO_BE_PAY = 1;

    public static final Integer HAS_NOT_GENERATED = 0;
    public static final Integer HAS_GENERATED = 1;
}
