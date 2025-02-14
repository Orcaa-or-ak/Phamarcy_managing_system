PGDMP                       |            famacy    16.3    16.3 4    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    16666    famacy    DATABASE     ~   CREATE DATABASE famacy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1258';
    DROP DATABASE famacy;
                postgres    false            �            1259    16667    Account    TABLE     �   CREATE TABLE public."Account" (
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    employee_id integer NOT NULL
);
    DROP TABLE public."Account";
       public         heap    postgres    false            �            1259    16672    Administrator    TABLE     V   CREATE TABLE public."Administrator" (
    "AID" integer NOT NULL,
    "AName" text
);
 #   DROP TABLE public."Administrator";
       public         heap    postgres    false            �            1259    16677    Administrator_AID_seq    SEQUENCE     �   ALTER TABLE public."Administrator" ALTER COLUMN "AID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Administrator_AID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16678 
   Consumable    TABLE     �   CREATE TABLE public."Consumable" (
    "CName" text NOT NULL,
    "Quantity" integer NOT NULL,
    "Supplied_date" text NOT NULL,
    "Supplier" text NOT NULL,
    "CPrice" double precision NOT NULL
);
     DROP TABLE public."Consumable";
       public         heap    postgres    false            �            1259    16683    Employee    TABLE     �   CREATE TABLE public."Employee" (
    "EID" integer NOT NULL,
    "EName" text NOT NULL,
    "Gender" text NOT NULL,
    "Role" text NOT NULL,
    "Birth" text NOT NULL,
    "Phone" text
);
    DROP TABLE public."Employee";
       public         heap    postgres    false            �            1259    16842    Item    TABLE     �   CREATE TABLE public."Item" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    type character varying(50) NOT NULL
);
    DROP TABLE public."Item";
       public         heap    postgres    false            �            1259    16847    Item_id_seq    SEQUENCE     �   ALTER TABLE public."Item" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Item_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16688    Medicine    TABLE       CREATE TABLE public."Medicine" (
    "MName" text NOT NULL,
    "Batch" text NOT NULL,
    "Supplier" text NOT NULL,
    "Supplied_date" text NOT NULL,
    "Expired_date" text NOT NULL,
    "Quantity" integer NOT NULL,
    "MPrice" double precision NOT NULL
);
    DROP TABLE public."Medicine";
       public         heap    postgres    false            �            1259    16693    Message    TABLE     �   CREATE TABLE public."Message" (
    "senderID" integer,
    "receiverID" integer,
    content text,
    "MID" integer NOT NULL
);
    DROP TABLE public."Message";
       public         heap    postgres    false            �            1259    16698    Message_MID_seq    SEQUENCE     �   ALTER TABLE public."Message" ALTER COLUMN "MID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Message_MID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16699    Supplier    TABLE     5   CREATE TABLE public."Supplier" (
    "SName" text
);
    DROP TABLE public."Supplier";
       public         heap    postgres    false            �            1259    16761    Transaction    TABLE     �   CREATE TABLE public."Transaction" (
    id integer NOT NULL,
    transaction_date text NOT NULL,
    total_amount double precision NOT NULL
);
 !   DROP TABLE public."Transaction";
       public         heap    postgres    false            �            1259    16777    TransactionItem    TABLE     �   CREATE TABLE public."TransactionItem" (
    id integer NOT NULL,
    transaction_id integer NOT NULL,
    name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    item_type text NOT NULL
);
 %   DROP TABLE public."TransactionItem";
       public         heap    postgres    false            �            1259    16776    TransactionItem_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TransactionItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."TransactionItem_id_seq";
       public          postgres    false    227            5           0    0    TransactionItem_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."TransactionItem_id_seq" OWNED BY public."TransactionItem".id;
          public          postgres    false    226            �            1259    16760    Transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Transaction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Transaction_id_seq";
       public          postgres    false    225            6           0    0    Transaction_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Transaction_id_seq" OWNED BY public."Transaction".id;
          public          postgres    false    224            x           2604    16764    Transaction id    DEFAULT     t   ALTER TABLE ONLY public."Transaction" ALTER COLUMN id SET DEFAULT nextval('public."Transaction_id_seq"'::regclass);
 ?   ALTER TABLE public."Transaction" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            y           2604    16780    TransactionItem id    DEFAULT     |   ALTER TABLE ONLY public."TransactionItem" ALTER COLUMN id SET DEFAULT nextval('public."TransactionItem_id_seq"'::regclass);
 C   ALTER TABLE public."TransactionItem" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227                       0    16667    Account 
   TABLE DATA           J   COPY public."Account" (username, password, role, employee_id) FROM stdin;
    public          postgres    false    215   �;       !          0    16672    Administrator 
   TABLE DATA           9   COPY public."Administrator" ("AID", "AName") FROM stdin;
    public          postgres    false    216   <       #          0    16678 
   Consumable 
   TABLE DATA           b   COPY public."Consumable" ("CName", "Quantity", "Supplied_date", "Supplier", "CPrice") FROM stdin;
    public          postgres    false    218   M<       $          0    16683    Employee 
   TABLE DATA           X   COPY public."Employee" ("EID", "EName", "Gender", "Role", "Birth", "Phone") FROM stdin;
    public          postgres    false    219   �>       -          0    16842    Item 
   TABLE DATA           7   COPY public."Item" (id, name, price, type) FROM stdin;
    public          postgres    false    228   �?       %          0    16688    Medicine 
   TABLE DATA           y   COPY public."Medicine" ("MName", "Batch", "Supplier", "Supplied_date", "Expired_date", "Quantity", "MPrice") FROM stdin;
    public          postgres    false    220   �G       &          0    16693    Message 
   TABLE DATA           M   COPY public."Message" ("senderID", "receiverID", content, "MID") FROM stdin;
    public          postgres    false    221   �V       (          0    16699    Supplier 
   TABLE DATA           -   COPY public."Supplier" ("SName") FROM stdin;
    public          postgres    false    223   wX       *          0    16761    Transaction 
   TABLE DATA           K   COPY public."Transaction" (id, transaction_date, total_amount) FROM stdin;
    public          postgres    false    225   �]       ,          0    16777    TransactionItem 
   TABLE DATA           a   COPY public."TransactionItem" (id, transaction_id, name, quantity, price, item_type) FROM stdin;
    public          postgres    false    227   �]       7           0    0    Administrator_AID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Administrator_AID_seq"', 1, true);
          public          postgres    false    217            8           0    0    Item_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Item_id_seq"', 123, true);
          public          postgres    false    229            9           0    0    Message_MID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Message_MID_seq"', 48, true);
          public          postgres    false    222            :           0    0    TransactionItem_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."TransactionItem_id_seq"', 18, true);
          public          postgres    false    226            ;           0    0    Transaction_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Transaction_id_seq"', 10, true);
          public          postgres    false    224            {           2606    16705    Account Account_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY (username);
 B   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "Account_pkey";
       public            postgres    false    215            }           2606    16707     Administrator Administrator_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Administrator"
    ADD CONSTRAINT "Administrator_pkey" PRIMARY KEY ("AID");
 N   ALTER TABLE ONLY public."Administrator" DROP CONSTRAINT "Administrator_pkey";
       public            postgres    false    216                       2606    16733    Consumable Consumable_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."Consumable"
    ADD CONSTRAINT "Consumable_pkey" PRIMARY KEY ("CName", "Supplier");
 H   ALTER TABLE ONLY public."Consumable" DROP CONSTRAINT "Consumable_pkey";
       public            postgres    false    218    218            �           2606    16709    Employee Employee_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("EID");
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_pkey";
       public            postgres    false    219            �           2606    16846    Item Item_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Item" DROP CONSTRAINT "Item_pkey";
       public            postgres    false    228            �           2606    16711    Medicine Medicine_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Medicine"
    ADD CONSTRAINT "Medicine_pkey" PRIMARY KEY ("MName", "Supplier");
 D   ALTER TABLE ONLY public."Medicine" DROP CONSTRAINT "Medicine_pkey";
       public            postgres    false    220    220            �           2606    16713    Message Message_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY ("MID");
 B   ALTER TABLE ONLY public."Message" DROP CONSTRAINT "Message_pkey";
       public            postgres    false    221            �           2606    16782 $   TransactionItem TransactionItem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."TransactionItem"
    ADD CONSTRAINT "TransactionItem_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."TransactionItem" DROP CONSTRAINT "TransactionItem_pkey";
       public            postgres    false    227            �           2606    16768    Transaction Transaction_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Transaction" DROP CONSTRAINT "Transaction_pkey";
       public            postgres    false    225            �           2606    16783 3   TransactionItem TransactionItem_transaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TransactionItem"
    ADD CONSTRAINT "TransactionItem_transaction_id_fkey" FOREIGN KEY (transaction_id) REFERENCES public."Transaction"(id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public."TransactionItem" DROP CONSTRAINT "TransactionItem_transaction_id_fkey";
       public          postgres    false    4743    225    227            �           2606    16798    Administrator admin_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Administrator"
    ADD CONSTRAINT admin_fkey FOREIGN KEY ("AID") REFERENCES public."Employee"("EID") NOT VALID;
 D   ALTER TABLE ONLY public."Administrator" DROP CONSTRAINT admin_fkey;
       public          postgres    false    216    4737    219            �           2606    16714    Account employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public."Employee"("EID") ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public."Account" DROP CONSTRAINT employee_id_fkey;
       public          postgres    false    219    215    4737            �           2606    16719    Message receive_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT receive_fkey FOREIGN KEY ("receiverID") REFERENCES public."Employee"("EID");
 @   ALTER TABLE ONLY public."Message" DROP CONSTRAINT receive_fkey;
       public          postgres    false    219    221    4737            �           2606    16724    Message sender_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT sender_fkey FOREIGN KEY ("senderID") REFERENCES public."Employee"("EID");
 ?   ALTER TABLE ONLY public."Message" DROP CONSTRAINT sender_fkey;
       public          postgres    false    221    219    4737                s   x��̻�0 �Z��Β�.كF`�H܅�az>+����/V�d25N���K-����jI�"G�%�֪�j���_��w��>�����6��X/�e~z��q��/�G�      !      x�3��,.�L�PH���L������� W/�      #   L  x�]R�n�0<S_��jn��k���HZza��0M
$�T��>-m�3�3�f���[p���������-g[��$���.�p<�;����q@�O�;���L`���;C~�GD0��.x�|�BDz9�W+���? ���2���4�A��W���~��T��>xQ�������HD�f;�+?�V����ո��W�"8�˴K�Y�	�AQo\:�KDɂ��V����X=i��z������D�b�@1�>���VmE�M�;����{��%a喭.lo\~�uGx9�4��cz"YE���+�OҸ���ѭi������Տ�O~�X~t��=B~�-�+��6i���bX�����,}�,q�	�QDI1���"r���������,k�p��f�S-��ղ��&F��y%�3i�@�|�aC����x���=�GV|��s�kw7�6B�4�&QΝ�ڠY�����?{�t��v�'hL��K��b�	N����)��6/t���׾��W�����<��$z<6,�����T$[�2й����O���/֭*r�Cz���Jα�__�,�� D      $   7  x�e�AN�0E��S�&�qǱ�Tm�J�@b��m��&����L$P�|���!x�J}5���1�WX���1��x��`M�X��,�Y T��˵z���������%M����*���\��x���7G &��;ֈ�fFV�6�j^b���&�'9�,X���=�Qh`ˮz�]�M7����GOj��v�A��8�9�M���N����܃���Έ��I1,Kn�O9B�7r�&��C�ĺ1^B�x(�����:��P����?�L�f���9Yޱ�H��˽�Q�V��|
LO�IsNZԖ�W�wJ�oY~C      -   �  x�}��r���ט��eR�����fL���3Sٴ����������4�5I6�$���`�Z�/�=ɚݟ����J�r/��fh��J��[���;v��V��,S�M�_��Z�p�������X&��ŋ�x3_.���E�ݤ��]�`�l���%�[�\%i�w�2݃R~�Z��X.���+)�Y�*}��f�'b+��v��=+pb/?D�Gf�(��Ń����C+R�"X�]�[�x=O�i���`�Ą|~A�ky�,����,+��-�����{F�ᑫ��=��9�/7��(��q�M�a9p����V�8��=�Ǖ�	�nE=b����I�q,����xV,���O�`S�o��5��ײ���?nh��� ��Uo�':�)p+�'��5d��z�@����1٭�
�P?X�������K�w���{�'���������1@oE�?D�Ju�6��m�\�`$��^�]�R�C=e�o�Uo��ہ���x��8����J�,���P�I��x�ě���,ٰ�2-��[e��".�lu�����`�#oq�3[�soμ��c?~*ěh�k�	��p8�كC�dP�+Vu�q��*�VlW�¡n��V�ȽN��Q�=�)�9�[6>�A)67��G�<��M��h�Y�'�zY�v�P?"��n��ֈ���4����PG9|�2~��Ǳ1����X�������h*��z�qa��i~S@�:�� �ݠ��l��
p�G�l�ah��R�N �s5�E=�I����R�N#���KQ:<��gŹ�'ݢ���C��f�A���ύo_�yNkY�l���n��]�����.޼���(O׆;�x=ʉ ��t8�J���x�w!=���M9:<��t=H�����]�e�Ǩ1�	e�P��8��sCXūP7x���j��;�"�˦�=�/�=
Ƴ {?j+�MP}Jȳa��8e��Kw�d��
�t}��s`�O�^gV_�ˍr����-B�Jٱ%�#$F�D�}(����n<#�<��l���|ضf�#��q��̅x�/#t���xnM���)/@��=>���~[|�/�E�
O��O����E��|�-/����ea�9ܤ�����S���<~L� �^�m�.٠����'������i2t@=��KZj**���{|
n��H� ��/(#�N@@�����?A�X�r�C�ZKֲ5��8�P�~D](!��S�8~,���i�g�}OK(���DދKY����h�I&!��0��A�ϔn���g�K,�X���'|&�ꃐ"\��źF�}!�xp'��@E+zq�&�5�^!�dVZ��|%:|'��C
5�;����U�k~j���k��m������"���I����d�.�<Η�H�˭���x���Ϲ��)�(�Ђ��7E#֯&3BD����/���'��C,?F�ƚ@w��M�Q�!V~E��%���Xk��C+?L���%z�+�$��2V�I���(����A�>
ED9�J�/�!��!d(m��hQ�a[�
k�m�rZ��k�Q
#
-���hX3
/B��\X��(�ȁ%Jèf�yh0��[3�.r1�N�B��֌r�<�@�-j1y�֌Ҋ|��^>�
](q�I�2�.
����aݩ��U�����5�xw���wF�m�����\�y��D���A\�L�+v��l��V��M����p����A���řa���n0����rҶ��9&c|�-?a�RwÉ?+cv�f���A��^���]7���ew���	=#c���W#C�sF����#j��F<�(c��aZ	��� j��;�C3����i��"�2�l�Ɗ�)}郮@b��Me�>P2M�uK�79V5��"Nl�� �G��|����n�'��Z��:��&_��c|��K�7�Y��9�x�� NF�8j�[Ygڋ���`��yv�܌��32��Ǘ/_���N�      %   �  x��Y�v�H<���N�f޳d 	�q���f�����RKb�@��E-��'� (K�>ئ%��̈����i�gq��RɯU)�2��A��A,KqPiv�˔9~���;YY�W"~�*}��_U,.��*T���*U%Ϟ�y|���<��*K�m���������>�ݳ��XsY>e9v��d�$��N2۳ح�q�g�W{�D,�R�")x��W�|u�u�f��c۶u�T�f{��^p����cV�y���mkh]��1V;���������F����;Z�W{P���.n2�����=�e���P�i�7Y)>��R߂�Ӯ9�j���<�������mm�jva#����c��A-Ga��DXf1b��ǥ�Xm,�6s]�/K��/�&��Y&�U�o)����(�����j����_PE)�T2�w���8_{�^{N���#�r��<?��d�o�����Y��>��r�
F���d�f��wlf�3Z^!�����Ƈ��� {����!R����c�����i��\Q��`��utH<��?E���8�g����ӌ ��oa�R���]D�V�������YHհ9���r[,�OߺxP�9ȓ�O)�u4�8�7d� ɪr9SO��j��e~0�)Vґi�8��0�%��i0����!\3��c7Y��)�Jb�\��<�������q�&� ����\�G�s��}\��5l޴O��9����\A"����#-���>�W�.%�>$%�c���(
%)�,v�ʽ?���@�V���!7���*�N�͇� ��B�@H&evP;Dϱ����Ė����+o~^�b�5˹�r6bڣ�������P�@��Fl�̴	A��Vf�P(-�X��]��,!����[��HE��m�Z��B=��c@�5�0-d\R=�s=6S��L�wm�B*��ϩE�s@�}�3h���p-��W�)D�_g*)	����p��HO'�����k)v'P�JwuM��5AcR��DE%�Z��<�X}�PsDh�D�$�)(5
�,N	�`s-S�Cs��$�=��t&!�u�㵻���u1�O�ݛ: Mo�Tu��� ܕ�>
�(Wzv�p�a8-3`= <X�u�g� �)-�_�lW�,nKk�:�������g�X@'u>� V����%�0d9@�<J*�H�(�j��}�3�nlփ�O�*����L�ӌBz����tn��鷸�hn�:��b�G#�4>��6��O���q�	��f��F��宾��!���2z��B~�cq*)��/��H�J�s�� e��ߩ�������Cܞ��ۀ=5"�*�r��Xc;ZM9�#���	��`�oX�*�E�����ѝ�(��H���P]r,6��Mt���?yyǈ���X��B�Ԑ�=�U���3*�<�[l8���? 4,L��tm�b�"����,��m]�M)CR����j}?G*7�l���:3���d9�5�a^��!�eo;�}� �U��6+�*-���j���1*&�ER�?Qu�QF��b2�-t�'w�w�9����� �x�/A�d�I��B�;�{RP�*W���Б��V�֋  ��k��i�9dO�6��4m���jȸ�zu	t���̂�D6��'��OƢ�~W@}S�m�@eQ���� �y���S��M��6Yd+Jy�<Ӆ�G��?�QQxt�KB@�+��i"^����sUPs~�(xt��x�@%�������3p�@s�*���un����������e��v�d����.da�]��P]��Ølhi(9�8C��U���{i9���/ԡ-�����F2ĳ6Ie�D��՛�ke�on0Ж��em8�V�59Q�TT2���)�kR6�rsQC��e�O>XH��]f�|���Ǉ�p�9W�F�o)�����,X�q0�{l�j���B�4���>0<���\Fڸ>��YO���_�K���zn&c�aG�vk:�W���p��gF%�y�m;T�MҜ7&�I8��+��޷d����&ɶ��韓wƹ׭��X(]���6[|����f��2�||�o03
>F�����m�'�R� (^�Ce�8��g��p����O�g���2� ��HC��l<� �s�Rt�)�E`�mD�}h���ݫ�Λsz�68�� P���*`�
�B�`��Bmel��#Wm�Z5PK�^�PiU����,'��0�.|¯�qF@m��E�pNwۣ3 �r���c�V�O�{����mN} <pح��Hj;�@����{��g���}2�
x<������x��GS,�j\j�b�e���9���3ίp�8���f��5	�8�'�C�;iӇu���]��&P	]@�O
,16�O�JZ�̴�jj�N��Jh��U�F���:�>���!��]��qk<�7X��V��=������3j�
���3��U��/Mȕ��r�>�5�z�^CrM�VzH�����9N���{
ڽ�w@�
S�q�C��$S��\���p�ƯC#�$�����L����H8Y,���
���{����-�����h̻����(Ss� o0@��V����@�j���P�z�n�t�<M;���?���!��a7䪭���Z9�S�ݿC��P��a��1I�:|y��kk��y�و)�<�� z�ɷ�`.&�_Q���A$տ�M�I��9��/��F���z���?��D=�hy�h�?R`��)&d.p�!5�8���*9�=##�;�c"�!��ҍF�n�g<��| ��%M�iJe�c� ���ˇ�b4��%D͡�~KEfs��p8��k����YF_���A��`�N�Q&� ��G@�H�����U�U��q��z ��JQZ�Aby�i�1��g4�ʮ�rS��vP����z���,�I�Ȣ�<�����K�ruS�S����hj�����B�V��M�f��M��Qϵ��:��Q�T�B%\�Y�@��y6����r����ꦔf�k�S38Y�')-��y8���pq7��Q��E��dE��<��t�����t����~��[�q��5�~����J+��
j
���h�%�QoJ�t�^\�Dr����7n��Ns62�(���I�'���9�C���q]g��;V��v�lH#�i mhA��e��S�	�*X�;�U5۹gk@���!�>�»�O � .�g�(�F���Whh@M,0Ͷrq.�|��Ķ���:�uqm�Yp��u�$fw��dȾ#n�MڍH�.M4�Ch�C��6%���!���Y�ފڐa�����t�n>�E�nD�.~'�C ~��~Ё,���f���ιA0M�z/ȓʞ�юQWg�ngS��]<;��eN�m&���զ�Z��N�5��A����O�*PR���^[65MÊ<�y}�
(�CE]�������$;��3��:7�ӧX���pB���y�D/�@x�n��n��FN����p�p��Å��pdt[o�1^��lx��4�nM�,':u�$��%�-	��D�AZ���!����w>�D���\��ﲄ8E����$���K3]&&�յ��ۢaz��qr�Ev�ؚ.�;��w>ʥfx��#�\�gT�PPPÃ�u0�$��hدr	�ˡ�u�@���h%)��	��Uwe�" �
�#�y�w����$X!YCvw�Ý�>�ӓ�i$0Pd��zy3Yh:���p�L>�d�5O�����U���uT����CJ*r
5;B6�,�oY��nǕmu�����ܬC��M���suqq�?�_v      &   |  x�}�[�� E��U��QC�;��f	��yM
�Te�c���O����p�2§Y�!(�I(��₂¨c�����a��[b,�ԙ��nH#<��LQԯ��5~�9�Z"�QKl�,���T|B8�,���?�6N^��b3~7��	�d�A�5wSH���n��a]	���\ #ZC����^w��'!��9\����@F�*�G�J���"�,y�1�dE�,�N�#`���wٚ��.�P�}�mӽ��K'.F��0n�r�|	kL'��g�؜�7ܩ�lA��8,��vX���+?�IcwXR��%ѭ��$Z���s�A���{�܊)�r��lP #����_Z�e/]����1P�l\���Puv>eY��,[      (      x��V�r�8��+p�&U"������ZR���^ rD�Z<�0_��tە�\EKB������l=�y,f�,_��M�����ܚpae��}*�[]���VO��PC�]��ͳ��eS�	�y!t�򭥋�NlO�,4��-�n������
�Ju,o�|#us0�l�ύ;���Q�j�L��3{IY�}+N�F>I'�����Ւ��s�����s�߈3_S-+���7���2��W�؛�K�=٣$U'�u�L)�g�u"����$j���p��R�$�IͶִĄ߉�\_�ʃR&4-۶���/υ�l���+Yפ�oW�z��$���胥+�>-S>ulLn���zAM�A25dCQ���>�񭫃��Vس�(@x�����>Ц:����<KO5�G+^���3�{�QVt�Jؓԣ��g��V�:���� �ܤ|9���w��ٝ���m��Ttd�>T'�>Y�� -!��2^a�m��i���*�v��8z���ZQ�fˠk��) �!��șV�����R��� ���_�ْ#-��R$��`������b�zV��ن��jV��~��6�l���,L�f�l#����]������C>��?{0���h8k`���J:o�����+�{�J�B��{�-9�㏹�J��e__.�W��L���6��Ub�"�;"�T-/���&��ٱBB%s�`�����e���̓�i��'������O�?>�۪�F���y��\&c����H��Fg%N,��R%�Qb�����`i+g��W�=�:5���}��a3��	r�"���њb�}m^ǿ�������1%ĉ�W_C��� 7�������4���w}� �M*�zi�?B��lH���{X%F8�����B�5���.��Ŭ���b����c$��	@��aKL��j�t���RLO��n,]��'�`
�le��dk�;�`�ZxV�eG�`	�y%<J�dE�3 �>[͋�l�I};�(��U�}�m���r���۾�`�Ly�Ϩ�M�Qذ'o̳�Ln�D�u���aC `�Aһ��I�D ��nj,1:��W�z�M�i�="v�P+L#Z�ri(/t]|�6d������o���5��W��BBZ	}��g���+ i����S����I���d��l0���+�M ,��&"�Ɯ����d�~
��K�P�9�8��!�\�o:�'��S�M.�Қ�D�*���j���0�h�+R��XH�H`������Ic���G�      *   L   x�m��� ��m/�r��B�u(L�N��+3��eE"	��O�^ܦ�8�}ޔn�#=R/ñ�W�+cp0�G      ,   �   x��н
�0���)���'mG)"VG��\�Ҵ�o�� 6]���9�H�`�h�e��"�����C����<"������A���>-&�:r�Mc�[^�CR�ԺH��aO�5�t�6͠����qR�=	&r��[��.)H����r<���*)�L�P�v�"��y�&�����u�}��]�}&     