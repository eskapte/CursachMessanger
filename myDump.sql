PGDMP         %                x            messanger_db    10.10    10.10 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    25810    messanger_db    DATABASE     �   CREATE DATABASE messanger_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE messanger_db;
             admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                        0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    25997    Messanger_chat    TABLE     b   CREATE TABLE public."Messanger_chat" (
    id integer NOT NULL,
    is_dialog boolean NOT NULL
);
 $   DROP TABLE public."Messanger_chat";
       public         admin    false    3            �            1259    25995    Messanger_chat_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Messanger_chat_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Messanger_chat_id_seq";
       public       admin    false    216    3                       0    0    Messanger_chat_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Messanger_chat_id_seq" OWNED BY public."Messanger_chat".id;
            public       admin    false    215            �            1259    26005    Messanger_chat_participants    TABLE     �   CREATE TABLE public."Messanger_chat_participants" (
    id integer NOT NULL,
    chat_id integer NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public."Messanger_chat_participants";
       public         admin    false    3            �            1259    26003 "   Messanger_chat_participants_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Messanger_chat_participants_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."Messanger_chat_participants_id_seq";
       public       admin    false    218    3                       0    0 "   Messanger_chat_participants_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Messanger_chat_participants_id_seq" OWNED BY public."Messanger_chat_participants".id;
            public       admin    false    217            �            1259    26023    Messanger_message    TABLE     �   CREATE TABLE public."Messanger_message" (
    id integer NOT NULL,
    text text NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    is_readed boolean NOT NULL,
    author_id integer NOT NULL,
    chat_id integer NOT NULL
);
 '   DROP TABLE public."Messanger_message";
       public         admin    false    3            �            1259    26021    Messanger_message_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Messanger_message_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Messanger_message_id_seq";
       public       admin    false    222    3                       0    0    Messanger_message_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Messanger_message_id_seq" OWNED BY public."Messanger_message".id;
            public       admin    false    221            �            1259    26013    Messanger_profile    TABLE     �   CREATE TABLE public."Messanger_profile" (
    id integer NOT NULL,
    icon character varying(100),
    status character varying(100),
    user_id integer NOT NULL
);
 '   DROP TABLE public."Messanger_profile";
       public         admin    false    3            �            1259    26011    Messanger_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Messanger_profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Messanger_profile_id_seq";
       public       admin    false    220    3                       0    0    Messanger_profile_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Messanger_profile_id_seq" OWNED BY public."Messanger_profile".id;
            public       admin    false    219            �            1259    25842 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         admin    false    3            �            1259    25840    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       admin    false    3    203                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       admin    false    202            �            1259    25852    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         admin    false    3            �            1259    25850    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       admin    false    3    205                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       admin    false    204            �            1259    25834    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         admin    false    3            �            1259    25832    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       admin    false    3    201                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       admin    false    200            �            1259    25860 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         admin    false    3            �            1259    25870    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         admin    false    3            �            1259    25868    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       admin    false    209    3                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       admin    false    208            �            1259    25858    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       admin    false    3    207            	           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       admin    false    206            �            1259    25878    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         admin    false    3            �            1259    25876 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       admin    false    211    3            
           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       admin    false    210            �            1259    25938    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         admin    false    3            �            1259    25936    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       admin    false    3    213                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       admin    false    212            �            1259    25824    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         admin    false    3            �            1259    25822    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       admin    false    3    199                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       admin    false    198            �            1259    25813    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         admin    false    3            �            1259    25811    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       admin    false    197    3                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       admin    false    196            �            1259    25984    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         admin    false    3            �            1259    26065    messanger_chat    TABLE     �   CREATE TABLE public.messanger_chat (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL
);
 "   DROP TABLE public.messanger_chat;
       public         admin    false    3            �            1259    26063    messanger_chat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messanger_chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.messanger_chat_id_seq;
       public       admin    false    3    224                       0    0    messanger_chat_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.messanger_chat_id_seq OWNED BY public.messanger_chat.id;
            public       admin    false    223            �            1259    26073    messanger_chat_users    TABLE     �   CREATE TABLE public.messanger_chat_users (
    id integer NOT NULL,
    chat_id integer NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.messanger_chat_users;
       public         admin    false    3            �            1259    26071    messanger_chat_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messanger_chat_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.messanger_chat_users_id_seq;
       public       admin    false    226    3                       0    0    messanger_chat_users_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.messanger_chat_users_id_seq OWNED BY public.messanger_chat_users.id;
            public       admin    false    225            �            1259    26081    messanger_chatmessage    TABLE     �   CREATE TABLE public.messanger_chatmessage (
    id integer NOT NULL,
    text text NOT NULL,
    created timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    chat_id integer NOT NULL
);
 )   DROP TABLE public.messanger_chatmessage;
       public         admin    false    3            �            1259    26079    messanger_chatmessage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messanger_chatmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.messanger_chatmessage_id_seq;
       public       admin    false    3    228                       0    0    messanger_chatmessage_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.messanger_chatmessage_id_seq OWNED BY public.messanger_chatmessage.id;
            public       admin    false    227            �            1259    26137    messanger_chatmessage_is_readed    TABLE     �   CREATE TABLE public.messanger_chatmessage_is_readed (
    id integer NOT NULL,
    chatmessage_id integer NOT NULL,
    user_id integer NOT NULL
);
 3   DROP TABLE public.messanger_chatmessage_is_readed;
       public         admin    false    3            �            1259    26135 &   messanger_chatmessage_is_readed_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messanger_chatmessage_is_readed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.messanger_chatmessage_is_readed_id_seq;
       public       admin    false    3    230                       0    0 &   messanger_chatmessage_is_readed_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.messanger_chatmessage_is_readed_id_seq OWNED BY public.messanger_chatmessage_is_readed.id;
            public       admin    false    229            �            1259    26184    messanger_profile    TABLE     �   CREATE TABLE public.messanger_profile (
    id integer NOT NULL,
    icon character varying(100),
    status character varying(100),
    user_id integer NOT NULL,
    role character varying(30) NOT NULL
);
 %   DROP TABLE public.messanger_profile;
       public         admin    false    3            �            1259    26182    messanger_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messanger_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.messanger_profile_id_seq;
       public       admin    false    232    3                       0    0    messanger_profile_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.messanger_profile_id_seq OWNED BY public.messanger_profile.id;
            public       admin    false    231            �
           2604    26000    Messanger_chat id    DEFAULT     z   ALTER TABLE ONLY public."Messanger_chat" ALTER COLUMN id SET DEFAULT nextval('public."Messanger_chat_id_seq"'::regclass);
 B   ALTER TABLE public."Messanger_chat" ALTER COLUMN id DROP DEFAULT;
       public       admin    false    216    215    216            �
           2604    26008    Messanger_chat_participants id    DEFAULT     �   ALTER TABLE ONLY public."Messanger_chat_participants" ALTER COLUMN id SET DEFAULT nextval('public."Messanger_chat_participants_id_seq"'::regclass);
 O   ALTER TABLE public."Messanger_chat_participants" ALTER COLUMN id DROP DEFAULT;
       public       admin    false    217    218    218            �
           2604    26026    Messanger_message id    DEFAULT     �   ALTER TABLE ONLY public."Messanger_message" ALTER COLUMN id SET DEFAULT nextval('public."Messanger_message_id_seq"'::regclass);
 E   ALTER TABLE public."Messanger_message" ALTER COLUMN id DROP DEFAULT;
       public       admin    false    222    221    222            �
           2604    26016    Messanger_profile id    DEFAULT     �   ALTER TABLE ONLY public."Messanger_profile" ALTER COLUMN id SET DEFAULT nextval('public."Messanger_profile_id_seq"'::regclass);
 E   ALTER TABLE public."Messanger_profile" ALTER COLUMN id DROP DEFAULT;
       public       admin    false    219    220    220            �
           2604    25845    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       admin    false    203    202    203            �
           2604    25855    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       admin    false    204    205    205            �
           2604    25837    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       admin    false    200    201    201            �
           2604    25863    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       admin    false    207    206    207            �
           2604    25873    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       admin    false    209    208    209            �
           2604    25881    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       admin    false    211    210    211            �
           2604    25941    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       admin    false    212    213    213            �
           2604    25827    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       admin    false    198    199    199            �
           2604    25816    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       admin    false    196    197    197            �
           2604    26068    messanger_chat id    DEFAULT     v   ALTER TABLE ONLY public.messanger_chat ALTER COLUMN id SET DEFAULT nextval('public.messanger_chat_id_seq'::regclass);
 @   ALTER TABLE public.messanger_chat ALTER COLUMN id DROP DEFAULT;
       public       admin    false    223    224    224            �
           2604    26076    messanger_chat_users id    DEFAULT     �   ALTER TABLE ONLY public.messanger_chat_users ALTER COLUMN id SET DEFAULT nextval('public.messanger_chat_users_id_seq'::regclass);
 F   ALTER TABLE public.messanger_chat_users ALTER COLUMN id DROP DEFAULT;
       public       admin    false    226    225    226            �
           2604    26084    messanger_chatmessage id    DEFAULT     �   ALTER TABLE ONLY public.messanger_chatmessage ALTER COLUMN id SET DEFAULT nextval('public.messanger_chatmessage_id_seq'::regclass);
 G   ALTER TABLE public.messanger_chatmessage ALTER COLUMN id DROP DEFAULT;
       public       admin    false    227    228    228            �
           2604    26140 "   messanger_chatmessage_is_readed id    DEFAULT     �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed ALTER COLUMN id SET DEFAULT nextval('public.messanger_chatmessage_is_readed_id_seq'::regclass);
 Q   ALTER TABLE public.messanger_chatmessage_is_readed ALTER COLUMN id DROP DEFAULT;
       public       admin    false    230    229    230            �
           2604    26187    messanger_profile id    DEFAULT     |   ALTER TABLE ONLY public.messanger_profile ALTER COLUMN id SET DEFAULT nextval('public.messanger_profile_id_seq'::regclass);
 C   ALTER TABLE public.messanger_profile ALTER COLUMN id DROP DEFAULT;
       public       admin    false    232    231    232            �          0    25997    Messanger_chat 
   TABLE DATA               9   COPY public."Messanger_chat" (id, is_dialog) FROM stdin;
    public       admin    false    216   ��       �          0    26005    Messanger_chat_participants 
   TABLE DATA               M   COPY public."Messanger_chat_participants" (id, chat_id, user_id) FROM stdin;
    public       admin    false    218   ��       �          0    26023    Messanger_message 
   TABLE DATA               `   COPY public."Messanger_message" (id, text, pub_date, is_readed, author_id, chat_id) FROM stdin;
    public       admin    false    222   ��       �          0    26013    Messanger_profile 
   TABLE DATA               H   COPY public."Messanger_profile" (id, icon, status, user_id) FROM stdin;
    public       admin    false    220   ��       �          0    25842 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       admin    false    203   ��       �          0    25852    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       admin    false    205   �       �          0    25834    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       admin    false    201   .�       �          0    25860 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       admin    false    207   d      �          0    25870    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       admin    false    209   �      �          0    25878    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       admin    false    211   �      �          0    25938    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       admin    false    213   �      �          0    25824    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       admin    false    199   =      �          0    25813    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       admin    false    197   �      �          0    25984    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       admin    false    214   d      �          0    26065    messanger_chat 
   TABLE DATA               ;   COPY public.messanger_chat (id, name, created) FROM stdin;
    public       admin    false    224   y      �          0    26073    messanger_chat_users 
   TABLE DATA               D   COPY public.messanger_chat_users (id, chat_id, user_id) FROM stdin;
    public       admin    false    226   �      �          0    26081    messanger_chatmessage 
   TABLE DATA               V   COPY public.messanger_chatmessage (id, text, created, author_id, chat_id) FROM stdin;
    public       admin    false    228   �      �          0    26137    messanger_chatmessage_is_readed 
   TABLE DATA               V   COPY public.messanger_chatmessage_is_readed (id, chatmessage_id, user_id) FROM stdin;
    public       admin    false    230   S      �          0    26184    messanger_profile 
   TABLE DATA               L   COPY public.messanger_profile (id, icon, status, user_id, role) FROM stdin;
    public       admin    false    232   $                 0    0    Messanger_chat_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Messanger_chat_id_seq"', 1, false);
            public       admin    false    215                       0    0 "   Messanger_chat_participants_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."Messanger_chat_participants_id_seq"', 1, false);
            public       admin    false    217                       0    0    Messanger_message_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Messanger_message_id_seq"', 1, false);
            public       admin    false    221                       0    0    Messanger_profile_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Messanger_profile_id_seq"', 1, false);
            public       admin    false    219                       0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       admin    false    202                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       admin    false    204                       0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);
            public       admin    false    200                       0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       admin    false    208                       0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);
            public       admin    false    206                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       admin    false    210                       0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 85, true);
            public       admin    false    212                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
            public       admin    false    198                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);
            public       admin    false    196                        0    0    messanger_chat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.messanger_chat_id_seq', 50, true);
            public       admin    false    223            !           0    0    messanger_chat_users_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.messanger_chat_users_id_seq', 64, true);
            public       admin    false    225            "           0    0    messanger_chatmessage_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.messanger_chatmessage_id_seq', 158, true);
            public       admin    false    227            #           0    0 &   messanger_chatmessage_is_readed_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.messanger_chatmessage_is_readed_id_seq', 45538, true);
            public       admin    false    229            $           0    0    messanger_profile_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.messanger_profile_id_seq', 9, true);
            public       admin    false    231            $           2606    26033 U   Messanger_chat_participants Messanger_chat_participants_chat_id_user_id_8f97e809_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Messanger_chat_participants"
    ADD CONSTRAINT "Messanger_chat_participants_chat_id_user_id_8f97e809_uniq" UNIQUE (chat_id, user_id);
 �   ALTER TABLE ONLY public."Messanger_chat_participants" DROP CONSTRAINT "Messanger_chat_participants_chat_id_user_id_8f97e809_uniq";
       public         admin    false    218    218            &           2606    26010 <   Messanger_chat_participants Messanger_chat_participants_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Messanger_chat_participants"
    ADD CONSTRAINT "Messanger_chat_participants_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY public."Messanger_chat_participants" DROP CONSTRAINT "Messanger_chat_participants_pkey";
       public         admin    false    218            !           2606    26002 "   Messanger_chat Messanger_chat_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Messanger_chat"
    ADD CONSTRAINT "Messanger_chat_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."Messanger_chat" DROP CONSTRAINT "Messanger_chat_pkey";
       public         admin    false    216            /           2606    26031 (   Messanger_message Messanger_message_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Messanger_message"
    ADD CONSTRAINT "Messanger_message_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Messanger_message" DROP CONSTRAINT "Messanger_message_pkey";
       public         admin    false    222            )           2606    26018 (   Messanger_profile Messanger_profile_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Messanger_profile"
    ADD CONSTRAINT "Messanger_profile_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Messanger_profile" DROP CONSTRAINT "Messanger_profile_pkey";
       public         admin    false    220            +           2606    26020 /   Messanger_profile Messanger_profile_user_id_key 
   CONSTRAINT     q   ALTER TABLE ONLY public."Messanger_profile"
    ADD CONSTRAINT "Messanger_profile_user_id_key" UNIQUE (user_id);
 ]   ALTER TABLE ONLY public."Messanger_profile" DROP CONSTRAINT "Messanger_profile_user_id_key";
       public         admin    false    220            �
           2606    25967    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         admin    false    203                       2606    25894 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         admin    false    205    205                       2606    25857 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         admin    false    205                        2606    25847    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         admin    false    203            �
           2606    25885 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         admin    false    201    201            �
           2606    25839 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         admin    false    201                       2606    25875 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         admin    false    209                       2606    25909 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         admin    false    209    209                       2606    25865    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         admin    false    207                       2606    25883 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         admin    false    211                       2606    25923 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         admin    false    211    211                       2606    25961     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         admin    false    207                       2606    25947 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         admin    false    213            �
           2606    25831 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         admin    false    199    199            �
           2606    25829 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         admin    false    199            �
           2606    25821 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         admin    false    197                       2606    25991 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         admin    false    214            1           2606    26070 "   messanger_chat messanger_chat_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.messanger_chat
    ADD CONSTRAINT messanger_chat_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.messanger_chat DROP CONSTRAINT messanger_chat_pkey;
       public         admin    false    224            4           2606    26091 G   messanger_chat_users messanger_chat_users_chat_id_user_id_aed16e70_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chat_users
    ADD CONSTRAINT messanger_chat_users_chat_id_user_id_aed16e70_uniq UNIQUE (chat_id, user_id);
 q   ALTER TABLE ONLY public.messanger_chat_users DROP CONSTRAINT messanger_chat_users_chat_id_user_id_aed16e70_uniq;
       public         admin    false    226    226            6           2606    26078 .   messanger_chat_users messanger_chat_users_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.messanger_chat_users
    ADD CONSTRAINT messanger_chat_users_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.messanger_chat_users DROP CONSTRAINT messanger_chat_users_pkey;
       public         admin    false    226            =           2606    26144 ]   messanger_chatmessage_is_readed messanger_chatmessage_is_chatmessage_id_user_id_7b282c5b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed
    ADD CONSTRAINT messanger_chatmessage_is_chatmessage_id_user_id_7b282c5b_uniq UNIQUE (chatmessage_id, user_id);
 �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed DROP CONSTRAINT messanger_chatmessage_is_chatmessage_id_user_id_7b282c5b_uniq;
       public         admin    false    230    230            @           2606    26142 D   messanger_chatmessage_is_readed messanger_chatmessage_is_readed_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed
    ADD CONSTRAINT messanger_chatmessage_is_readed_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.messanger_chatmessage_is_readed DROP CONSTRAINT messanger_chatmessage_is_readed_pkey;
       public         admin    false    230            ;           2606    26089 0   messanger_chatmessage messanger_chatmessage_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.messanger_chatmessage
    ADD CONSTRAINT messanger_chatmessage_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.messanger_chatmessage DROP CONSTRAINT messanger_chatmessage_pkey;
       public         admin    false    228            C           2606    26189 (   messanger_profile messanger_profile_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.messanger_profile
    ADD CONSTRAINT messanger_profile_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.messanger_profile DROP CONSTRAINT messanger_profile_pkey;
       public         admin    false    232            E           2606    26191 /   messanger_profile messanger_profile_user_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.messanger_profile
    ADD CONSTRAINT messanger_profile_user_id_key UNIQUE (user_id);
 Y   ALTER TABLE ONLY public.messanger_profile DROP CONSTRAINT messanger_profile_user_id_key;
       public         admin    false    232            "           1259    26044 ,   Messanger_chat_participants_chat_id_cc1ef4e4    INDEX     {   CREATE INDEX "Messanger_chat_participants_chat_id_cc1ef4e4" ON public."Messanger_chat_participants" USING btree (chat_id);
 B   DROP INDEX public."Messanger_chat_participants_chat_id_cc1ef4e4";
       public         admin    false    218            '           1259    26045 ,   Messanger_chat_participants_user_id_38655cc8    INDEX     {   CREATE INDEX "Messanger_chat_participants_user_id_38655cc8" ON public."Messanger_chat_participants" USING btree (user_id);
 B   DROP INDEX public."Messanger_chat_participants_user_id_38655cc8";
       public         admin    false    218            ,           1259    26061 $   Messanger_message_author_id_b55e2c4f    INDEX     k   CREATE INDEX "Messanger_message_author_id_b55e2c4f" ON public."Messanger_message" USING btree (author_id);
 :   DROP INDEX public."Messanger_message_author_id_b55e2c4f";
       public         admin    false    222            -           1259    26062 "   Messanger_message_chat_id_7ce65277    INDEX     g   CREATE INDEX "Messanger_message_chat_id_7ce65277" ON public."Messanger_message" USING btree (chat_id);
 8   DROP INDEX public."Messanger_message_chat_id_7ce65277";
       public         admin    false    222            �
           1259    25968    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         admin    false    203                       1259    25905 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         admin    false    205                       1259    25906 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         admin    false    205            �
           1259    25891 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         admin    false    201                       1259    25921 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         admin    false    209                       1259    25920 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         admin    false    209                       1259    25935 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         admin    false    211                       1259    25934 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         admin    false    211            	           1259    25962     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         admin    false    207                       1259    25958 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         admin    false    213                       1259    25959 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         admin    false    213                       1259    25993 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         admin    false    214                       1259    25992 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         admin    false    214            2           1259    26102 %   messanger_chat_users_chat_id_fb7b7eb4    INDEX     i   CREATE INDEX messanger_chat_users_chat_id_fb7b7eb4 ON public.messanger_chat_users USING btree (chat_id);
 9   DROP INDEX public.messanger_chat_users_chat_id_fb7b7eb4;
       public         admin    false    226            7           1259    26103 %   messanger_chat_users_user_id_035403a5    INDEX     i   CREATE INDEX messanger_chat_users_user_id_035403a5 ON public.messanger_chat_users USING btree (user_id);
 9   DROP INDEX public.messanger_chat_users_user_id_035403a5;
       public         admin    false    226            8           1259    26114 (   messanger_chatmessage_author_id_0ab3601b    INDEX     o   CREATE INDEX messanger_chatmessage_author_id_0ab3601b ON public.messanger_chatmessage USING btree (author_id);
 <   DROP INDEX public.messanger_chatmessage_author_id_0ab3601b;
       public         admin    false    228            9           1259    26115 &   messanger_chatmessage_chat_id_3e3e00b8    INDEX     k   CREATE INDEX messanger_chatmessage_chat_id_3e3e00b8 ON public.messanger_chatmessage USING btree (chat_id);
 :   DROP INDEX public.messanger_chatmessage_chat_id_3e3e00b8;
       public         admin    false    228            >           1259    26155 7   messanger_chatmessage_is_readed_chatmessage_id_ab6a26ae    INDEX     �   CREATE INDEX messanger_chatmessage_is_readed_chatmessage_id_ab6a26ae ON public.messanger_chatmessage_is_readed USING btree (chatmessage_id);
 K   DROP INDEX public.messanger_chatmessage_is_readed_chatmessage_id_ab6a26ae;
       public         admin    false    230            A           1259    26156 0   messanger_chatmessage_is_readed_user_id_9c119429    INDEX        CREATE INDEX messanger_chatmessage_is_readed_user_id_9c119429 ON public.messanger_chatmessage_is_readed USING btree (user_id);
 D   DROP INDEX public.messanger_chatmessage_is_readed_user_id_9c119429;
       public         admin    false    230            O           2606    26034 N   Messanger_chat_participants Messanger_chat_parti_chat_id_cc1ef4e4_fk_Messanger    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messanger_chat_participants"
    ADD CONSTRAINT "Messanger_chat_parti_chat_id_cc1ef4e4_fk_Messanger" FOREIGN KEY (chat_id) REFERENCES public."Messanger_chat"(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public."Messanger_chat_participants" DROP CONSTRAINT "Messanger_chat_parti_chat_id_cc1ef4e4_fk_Messanger";
       public       admin    false    216    218    2849            P           2606    26039 X   Messanger_chat_participants Messanger_chat_participants_user_id_38655cc8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messanger_chat_participants"
    ADD CONSTRAINT "Messanger_chat_participants_user_id_38655cc8_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Messanger_chat_participants" DROP CONSTRAINT "Messanger_chat_participants_user_id_38655cc8_fk_auth_user_id";
       public       admin    false    2824    218    207            R           2606    26051 F   Messanger_message Messanger_message_author_id_b55e2c4f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messanger_message"
    ADD CONSTRAINT "Messanger_message_author_id_b55e2c4f_fk_auth_user_id" FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public."Messanger_message" DROP CONSTRAINT "Messanger_message_author_id_b55e2c4f_fk_auth_user_id";
       public       admin    false    2824    222    207            S           2606    26056 I   Messanger_message Messanger_message_chat_id_7ce65277_fk_Messanger_chat_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messanger_message"
    ADD CONSTRAINT "Messanger_message_chat_id_7ce65277_fk_Messanger_chat_id" FOREIGN KEY (chat_id) REFERENCES public."Messanger_chat"(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public."Messanger_message" DROP CONSTRAINT "Messanger_message_chat_id_7ce65277_fk_Messanger_chat_id";
       public       admin    false    216    222    2849            Q           2606    26046 D   Messanger_profile Messanger_profile_user_id_33210a3b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messanger_profile"
    ADD CONSTRAINT "Messanger_profile_user_id_33210a3b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public."Messanger_profile" DROP CONSTRAINT "Messanger_profile_user_id_33210a3b_fk_auth_user_id";
       public       admin    false    220    207    2824            H           2606    25900 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       admin    false    2811    205    201            G           2606    25895 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       admin    false    205    2816    203            F           2606    25886 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       admin    false    201    199    2806            J           2606    25915 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       admin    false    203    209    2816            I           2606    25910 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       admin    false    2824    209    207            L           2606    25929 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       admin    false    211    201    2811            K           2606    25924 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       admin    false    207    211    2824            M           2606    25948 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       admin    false    2806    213    199            N           2606    25953 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       admin    false    2824    213    207            U           2606    26125 O   messanger_chat_users messanger_chat_users_chat_id_fb7b7eb4_fk_messanger_chat_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chat_users
    ADD CONSTRAINT messanger_chat_users_chat_id_fb7b7eb4_fk_messanger_chat_id FOREIGN KEY (chat_id) REFERENCES public.messanger_chat(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.messanger_chat_users DROP CONSTRAINT messanger_chat_users_chat_id_fb7b7eb4_fk_messanger_chat_id;
       public       admin    false    224    226    2865            T           2606    26120 J   messanger_chat_users messanger_chat_users_user_id_035403a5_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chat_users
    ADD CONSTRAINT messanger_chat_users_user_id_035403a5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.messanger_chat_users DROP CONSTRAINT messanger_chat_users_user_id_035403a5_fk_auth_user_id;
       public       admin    false    207    226    2824            Y           2606    26162 Y   messanger_chatmessage_is_readed messanger_chatmessag_chatmessage_id_ab6a26ae_fk_messanger    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed
    ADD CONSTRAINT messanger_chatmessag_chatmessage_id_ab6a26ae_fk_messanger FOREIGN KEY (chatmessage_id) REFERENCES public.messanger_chatmessage(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed DROP CONSTRAINT messanger_chatmessag_chatmessage_id_ab6a26ae_fk_messanger;
       public       admin    false    230    2875    228            X           2606    26157 R   messanger_chatmessage_is_readed messanger_chatmessag_user_id_9c119429_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chatmessage_is_readed
    ADD CONSTRAINT messanger_chatmessag_user_id_9c119429_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.messanger_chatmessage_is_readed DROP CONSTRAINT messanger_chatmessag_user_id_9c119429_fk_auth_user;
       public       admin    false    2824    207    230            V           2606    26104 N   messanger_chatmessage messanger_chatmessage_author_id_0ab3601b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chatmessage
    ADD CONSTRAINT messanger_chatmessage_author_id_0ab3601b_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.messanger_chatmessage DROP CONSTRAINT messanger_chatmessage_author_id_0ab3601b_fk_auth_user_id;
       public       admin    false    2824    228    207            W           2606    26130 Q   messanger_chatmessage messanger_chatmessage_chat_id_3e3e00b8_fk_messanger_chat_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_chatmessage
    ADD CONSTRAINT messanger_chatmessage_chat_id_3e3e00b8_fk_messanger_chat_id FOREIGN KEY (chat_id) REFERENCES public.messanger_chat(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.messanger_chatmessage DROP CONSTRAINT messanger_chatmessage_chat_id_3e3e00b8_fk_messanger_chat_id;
       public       admin    false    2865    228    224            Z           2606    26192 D   messanger_profile messanger_profile_user_id_e5fd94f5_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.messanger_profile
    ADD CONSTRAINT messanger_profile_user_id_e5fd94f5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.messanger_profile DROP CONSTRAINT messanger_profile_user_id_e5fd94f5_fk_auth_user_id;
       public       admin    false    207    2824    232            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   &  x�}�ϊ�0���S�	Jd�I|�k��Ѧ����Kn��K��Pz�k{X(��3�oTe4��8�Œ>�/3?�F}\6��j5ٶ�k�
�0��. ���l�NPq�@��m]/�8E`	���{�i��*��]����Q�ф�q9�c��O�(��)
Wg�u�>�Ax�f���:z!b�SBP��T �l����u��ӣ6%?W��T�t����l\����<�|�6}�ڤ?� �N3�,��F!���kģ�)i�h�����:a�B��̘H;a��1�u��*#�t�cx���W�����yL{�>l��\d�MyO�H���h��36f>���pb����Q[�w\M�@���O X�q96��:բN��Q�z\'[ݨS=���]�S-�d�v�B��k�����Cmŭ`fN�ơ[�JvV����W�kxQ�PK}xK�{bxKz"��%K�O�~��o����|S��FY[F��&���;pq����e��)������M��#�3��l��qH���M���.�f��'�O����w�      �   /  x�}��n�@���)�`��������M� ��(Rel�1�j�m}���^UU�>�y��5QK:�t��9���$̜��=_�lD�,�A2�Q�6�kf=������V���R5��O�u���*�|yy���R��1�Z9��
W��PX.���k��b�L⡀ ǀ&�K
��	!0p���F>ݬ���$֞�7X��-�AN�^Y���i����E09��%�K��w;Y!PdePN��A��TV0%$OSPt�j��6s[�mγ�("�Rݸ�E�c5t�osC��Z�j9�����^��M��´�
�D���(O��ﶯ���_������%���x@9F,�
dP����xXD�Y�Z����\g�|��UW�z�<2Y�^�,,���:\-���"1��{���B�.���OB�>��9�?�owWO���Z�,�7���<�>2�3/��U�e-�{U��Z��¹]�R���e�_�;�bu~ҲrS���Y�t�  "Q

��Ğ��91:�ߥ�?��g��>r�#()�+���Wb&����h      �      x������ � �      �      x������ � �      �   P  x��X�nG>����SP�Qw��\r�)R�"�9��N`�0(��MD ��H� faÂ��z�(�?3��3r�b<;�u�}]�]l�6۠	���%�͔����?ܑ;��9q�ܼ��f��T��Qu��nm�ww'��%�u���c#���/)+�*��֯#���|�3=���ତ�PV��|���ҕ��˟_�ZD���VPSR^PI��y��;��-��]��s�^���;qw��Vww��L�3�$��?̫��A�h�T��1��^��J����9�Ϝ��Jٵha�1�EW�34-\���$.�p'��?���K���ӄ��h�!��R��A�������\3�_j������RԿyqorew�<���s�
v1<>�o:����-��&���3z��̳%��p�ҽ���wo	:p7$���f������$��q��):8��o\ǟn�d��Q=$Փ����<nt�\(-�M����wt�o���	}CO�0:��k�[݁������׋����1δI��qB������o�	�����]cDbK/M"��$kĢ��JT��v������8~�w}�F(?�NF{���R�\1�|xKYc)��ɒ�x!�q~4!��P]
(�ʪ�+�|�R���d����mR�ܯag���Z�������]=�lh벺�JT�#���>���jG�ɏ>,
G�Q`,�!������1��1�ƈ�0���5Ucx�1������h1v ù��$=hQ2]���FB�2�����!�	Z�t�-����	�iA| �(D5M�t�Y�@�RA�K�iP���&�4��5��T�y����]"@N�$����2r&� eT,h�Cޡ�*- ��qУ�wȐ@��C�l�(������Mc�U�x�	�B�o�����#э7��Ѐ�
���5H(�2K.��a���x�Ѕ�x��Ń�P�IKqn�Q
K]p�U^i9�� J��88�]������E���`(-!T~hJ1i�.` e�e�a����1W�v��
I��sx	���Jfc��?�vc�4�����ds�l~=�_B^�����$H)���n�O�o�����b)e�5�-aݮn�~�/�$��c��Bӕ����1��uy�&�q�R`�,�WH�r�{uoʀ�I0Ҥ�}�õq#��:�H/�%a `,c�@k@`1���{�E#/z��6�H�e#/�0� P@� $�.$��x<`1�4�!$++4���Tu;�0��,ʌ��i��<ۍ�I���|dM6T�������h��^#���m~-�*O8�yJ1Z��=�޳MT���*$�h:�y�l�����2��B��@4�on,6�H&>_���,@��&n�U��qX��"�	,���Zg���q�M g�iWmQf R�; �}(;��*��Ai:��2�t�e�عqOX"zڽ��[\��
�i�l���i��y�����ɩ�Խ�O?��;��;���?�)���(�O^��}�C;/؝r���-��e^n\s��P�;�A�z�@�^���/��^�����b~�C�0e��2~t��lE�_��q��c!?���\�Y�(:��S��2Q�� ���"�B��,��޽0�k`b &���0��gX��?��!nq���qF�R��䉉>v��o��]/>�����^��7K�	� ]* ���z�v�����y�iZ7�~n`&�25�K�4����O���E]�8�_��� �gZǓ?/ma�w�l�@l��p| �t,
x����� P�@]rU��K����k!K      �   �   x�]�K� D��a���{�ޠ��)|dÂ�%B��<ό�@���C>q�tNDbgEl�8m�p����B�7��O��J$��A��e� W���"��]	��>ؼ脯�!5t�m�
U7תj<�#:uW��"���U�      �   |  x���K��0�59E�G�\�7w��dY�'��#��}�)�4���̆�G�/�P�n
�4}^�X0���]=վ)�!{e��P3�Rj�0~��_�����P�
^�S[w�K!��[	��?S�çBۿG��?��4�1�f�Au������Ɵ�񭯏���%h	<Z�!.��f~����6�S��H�%?t����.ah�q�-�z��ׄ�L_�RF���Y$>Kב��u��L��bE���H���i?�
y"�-�\���|M�6�3�mn`Q���ZK�)v3�Q&��ݩ�N�}S���c�}�~pmG�f�V�i�_8�γ����$I,�}��9%KRC�I~Q�f�<����1dVԢ��^(��.C��ڎ{�!�P9]� �s��n��
�iS�a���2��He����߁�u`�E��Muȶm"z?�Ǽ �`%���fA��a�|�"&�8���A�tXrV�pK�;�TkL%U%TI�c�w�V�+AR���� 5�� LJ��!���#��Z�ŉ�Ԝ.´�Qn	�!��W�CT�&�(
cm&Ԗ0��^/��%Cc��w�>���q ��ҙ0"�-a蜭���@�U����H�}B���U����M      �     x����n�H�u�)�5��i6������`͆{UA���H��g1�Ya!Y������uHzv	�T֬'a@;�$2��dn����Y=�=(���}�M����8G���������+y|�N������M��T��s��_���C�>�G}z�o���U�yETH�|Os~���T�|_���������y
^W��_�?�E�B�\�_���"�O��/�v�7	#�2�!�"�-��Px&<��?ǻ�p�S�7{�w�a�>��)#G��)�w$�w/�P��?!��g@?Cx���K�à���CK�XKj$���]�J��}�ۭv��B�R�� H���X�H�cǉ$(��g��P	G���'�n1B_�����'��i��^�g=�x�G^\ѳ�^����Χ��?����� ��'�\�p>�WG�����z��I-���=���a8.�w>��=��{ܑ[�\"]���h��)����j��0�f��IƔ����x�����E�!J�V;ՕuV���!����"Q�X����~�C��P� ��[�Ӻ���ns�Z̅��|��~�q#PQ�]��t�D�yԔ���$�f���}���J�]0� �LА�<�g���y2��>���P�6g�&/G�F��q���NӴgi/f�D��p�tw(� m�]H[��U�I9%z��t�I���v?�ր��9B`I�|�`�&��#U�q)[P�6�LVlw�v�x��ԁP@ʷll�L��a��6A�X&q�0㐤t_�~��.����-7��}QJ�X�a��8�M����w;z�K�9��8���5ř酨�(�X[��iN�v�tK� �EāHR���J�238��~�*]�ʙ�jQ��AP����"�,e�C	�h<m{���R:bY�@C`o���{Dy�ck�5�@��Ɲ�6+MR䓜
Oh.�bs]�vvk�Yvd[2�Xe���J`ӱ�U��ScB�, ;�^��� _���NĲ�R���CZ�A��\�j6�%��n�aG���p~t�fS�Hb5ѦPI�ѥn�P�+CEӲh��Ŏ��I�\�@�'��u�t �"��I�֔��$�'�����K>Y;�#W�^�Hh�H��e)���1J{��w:�nfX�w����l�� M����pJ���âj�؛ƿ�Q��Q��fWþ����J^f�]JgԠj�����mv�v��t��bG@��#�����"i����T�A�@k��������h{X�5���mv9777\�y      �   �   x�e�MK�0��s�)rw�kޮ2��0�y)[pC7����۴*�B ~��	�����4��hZ���%Ό��8�7dwO-cX1�,�Q�ARuhN�0��������b@�U��2�uc���`�C�-~':U5!Ș\ $\5ϓ��.���3-�M�%s��F@���sMvߗn,��\�yU�c��R>o>���9fBB8C����u�g)f<;i��s��DyZ�\@ժ��z>���!�A�2L����}qM�|FDg�      �   N   x����P�ac[ڧ���ҟ;B�@0�d���d���t���~�^jp�Z'���{���Y'��7�o��.�?�^      �   ]
  x��Y;����1��)�HDeVe}�/B���
���hc� �˵dm(d��p8C�+ 7��B��@C�1�nv������M������_����nx9\��/���S�l��������������������o�_��vx3����98�s����?��'P���x�.<hذyd�#�����;c;�w4����l�� �=�~U0���_���n�kH{߿��߶`|.������op.d_�æ�>D�b���g�j��s��Y���P��nAۿWs��_�a���[5A_���0�/Y�wëv�5��
�_�Y8���U(��+�o*�uյ�0�Q�0�!�(�Βg�Գ����O���`���at�ݙ���E�ly
Ci��g#��`�1�<��׎Q8�~R8[ӒGp�(vV�dϙ�|���'�G�Zcv��$t!��DM��c�� ���j���l#��\T��:gMY]Q.6����FsΏ9�Xrs��i�$"��p9����4����i#H�z���7xw��rq0R����@q�Þ7zZ��9��M��`r�4=�0��e_�8��WsJHA9km��I����"����
���A�զd�0��B�UX]���e�
;v�M�b)��~[�O�g���B�d1\r���|BDב$��b���24�؄x@I͔���M�.�D�O�a�o�1�(���,Lc��!�9S��]V��-+;���m� �mi^��FL,&e8���o昨J'����c�`:�9@y��J��;:/aW0�Y��}�����U���Eor���r37�KB j�6�j:T?��2��nI�@5��p�g��Z����M�L?�d���2B?O�>�9��nf�_��oʙ����K�;O��D���/��߳������/?��������:gvb�`�S�;�m;f��	�Wc�}2c!�;���*��A��#�&��`�J�U�J�i:��uuBB�x$d,���&w�y�(yR��A΅<.�(�w$H.6�T�ȿ"�/酻sE)�b�j�y�7G�� a��>s�&G$.J��Zh7cy=6�R'���BI�"��Q3���K���sk��f
*�3�
��Z-�>��Gn�EFJ('!��ʡ�|��]�Wyc3�b�ͫ�櫖G4�s������qZG>/ͭ�j��$fM%ԛ\1ə�BG�p"&\ڑC�9K�R	��HA��I�WY�LC�'V=V�-�ق�NU�t��4O/  ~t���X��x������3)M^��2�1�1eJ��j��҂}���5ҊOXx�O����vPJХP��:�y��ВҺ^H��׼�D��&�8��s�rK�t«.yS�����Z�v��j)�]�����ao##&�����J �t{`F��06�O��`�Y68�-��T�6G;��q���TԱ7� �&B�%���R��<�GJD	�)��U�@'$#�6Vlb]��D�-iPK ML�ت4��ѕ���%j�v��E����r����^'{N��!�������)?��L�M��B69����T�<�!�����M'��q$�[[�u\u2(!�5J[(��OH�m�\�f�����we�3vtj[�O��!y}bW΀8��4>B�����,e��RWГ(Nؾ�H=hű��(u�%b���:�l�YOP���Os:�a3�X�\���mF #޴�س��[P�o�s��2*%��ջdp��Og�:K�	lަv��R�3%t���m	�u�Z�ql��"�� ɯ��Z����x[i7�Tr��Md.�L+�
J�?]���B��L��;d��5��*�|t��tӝHnd�c��T!��=�#�	.�n��	�coN�B��D*�2�+���8F��i<D�M����,�=X;0�bVz�ϥFW �)Tҍn;B�VlN�ָSm2!��m"u���
J�\L�\Q��X�`U fL�Wb�2����H�B�	�����T���߀��u������IkHӦ��^�%E25��r#i�{!4�D5R��\"I7@h�F*��`�_�	%����T�zc��<���S�����8>�H������D��Ɯ7����Y&����h�ӧ.��H7jt�`U�}�����	)����ɕx5Sm^�8�8����h#^��{�G��e�&}xt���� _�e4�$lM�V���O1>����=f��%E/�T��Xw��4m�ˑ�p$�Ul�N5���5�y�>�^��>�%Y�^<Y�T�E��`ƾ�+�|�৹I�!����Nv��.�g�+Jm,;I^��!'�z�`)#��K�,��Bf����� GG�Z~d�m��H��B!����� ��y�Jt�j5�	,�n�(����]}�c\��6&R�����[�KL�e�N77x��>�j��d�j���G�9h;z35s��c���������[ @m�zY�V-:��#��17�)�-�A�y���?(�]�_���d1(�>�;c�
�T�Ө�}��N�Ώ��ם~@����%'J��]{�^g����p~`�v*�#��/����5�nDBz�Ճ��Lc8m?���D��
���v��=G�>h{&N=&佻�s��;;;���1x      �   �  x�-�[�,!C�����Ź����f���J[	�h���lK��m��v�������k����`q�6X�|<W���ng#�ĝ�f�m�>۴�k{M��h{��s�eR�-��ɂ�����-۽�{ly����6q#ۍ[l�_/q���ъ����v�-�ܧ�a�ٶ-�w��^���^a����j� х��Ќ�m�3RDarA����Ϸ���6�|��O�8||�4�Ղ��S�̰c�tYg��ێ��q&B'tL|=e�M�Q���n�J��S�v���BF:0:(���DF=�� %�h�	��*��0�(�(І�AF}%
1zh���z*/�~��2��BD�gqȥ�%�FI6����."�JD�<�H+��C������d�Y4����"H���P`�"�om�l������at��Q�v�G��bY��"
��N�W�&�����ݴ��l/�
Q:.�SHkG��m��?���,��$~|����OI=>�'�eӕ�ñD�۽�FZ�b)�X:�Kl���;��f����1�i�ӸDG�~)!I=��u�;��R,q%�KDB��Bɚ=Ys��h���GP��8y�㌜-�萓8�T�	��e�=,�sǡdrI�Ig��D~�����­E�O�J�@z��[=ҝ�N�M��@b��z�٧�7��<��3��4������oW8o��B�=�ܱ�v����o��9
��`z��}�Н"B���]}�$�?"�K<��K�U�����D���J��6�{���� ���:1�Ku�1��L��p�V�7�[��0
�_vʄ�	T�tMA$�	/9LV��V��Ӑ�F�N�
N�M��貿\9�|ҁ�k>i0�E�n1�1����L;��g0���3P�[|f�{|�g��3�eg�����^;3L;3Ԋ��	��慯oyo}��/E��"8���L����L�w:X�c�|:@�o��<�M�έ�7��L�ØQ7<��nxt=�g��$�A=|�y�N�NO��C�@e��1_����Ww��:����S��ME{
���p�Z� �w�4�uq�{��Hk5�V�m���5��j.��\�^[��5ȃo9��Q>o�ۂ7��¤)�X�來�:����NF�;В�M\��͉џ�����±�?_���Xe��uc�]c;�������T���V�0~�~��j,��      �   n   x�3��M-.N�KO-���MLO-�OIMK,�)��L����*H���42估�b��;/l���b��~.s"�b� N��NK�t�c�4#B�	�\�saǅ��X����� @ɇ�     