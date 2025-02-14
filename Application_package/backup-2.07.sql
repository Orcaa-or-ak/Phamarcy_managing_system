PGDMP                      |            famacy    16.3    16.3 4    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    221   W       (          0    16699    Supplier 
   TABLE DATA           -   COPY public."Supplier" ("SName") FROM stdin;
    public          postgres    false    223   �X       *          0    16761    Transaction 
   TABLE DATA           K   COPY public."Transaction" (id, transaction_date, total_amount) FROM stdin;
    public          postgres    false    225   �]       ,          0    16777    TransactionItem 
   TABLE DATA           a   COPY public."TransactionItem" (id, transaction_id, name, quantity, price, item_type) FROM stdin;
    public          postgres    false    227   ^       7           0    0    Administrator_AID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Administrator_AID_seq"', 1, true);
          public          postgres    false    217            8           0    0    Item_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Item_id_seq"', 124, true);
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
$�T��>-m�3�3�f���[p���������-g[��$���.�p<�;����q@�O�;���L`���;C~�GD0��.x�|�BDz9�W+���? ���2���4�A��W���~��T��>xQ�������HD�f;�+?�V����ո��W�"8�˴K�Y�	�AQo\:�KDɂ��V����X=i��z������D�b�@1�>���VmE�M�;����{��%a喭.lo\~�uGx9�4��cz"YE���+�OҸ���ѭi������Տ�O~�X~t��=B~�-�+��6i���bX�����,}�,q�	�QDI1���"r���������,k�p��f�S-��ղ��&F��y%�3i�@�|�aC����x���=�GV|��s�kw7�6B�4�&QΝ�ڠY�����?{�t��v�'hL��K��b�	N����)��6/t���׾��W�����<��$z<6,�����T$[�2й����O���/֭*r�Cz���Jα�__�,�� D      $   F  x�e��j1F�'O�/�nf��&���Ezӛ�i�Y���������w���W�Yj������ǐ��O�	K�%)E�5J�FV�PhX\.��m�c�`�QT2��XM�����1�T��xJ��7�!�'Ȁ�F"��4���ܤX�rHm��%�I�!�9�IgH	T�
y_����ŻFJ�t��Z�F'��Q <�c
�b�>����C�z`1R��*v3^�7$,rj�O>L6wr�$3mA���rR:Q�S��ո�9�<�?���zJ�P��mey�����M�l	/�O�!�t�[���ʣ��;�ۡ�w�oG����������b��      -   �  x�}��r�������eR����EB^LPR��f��)� uD=�����d#Q�~��w�\Z��ٴG]���5�2��)r��v�Ե����T��;�Ql[���U�_~*)ԩ5�T����ˊY6]�t��.'����:ݬ>�ٗ�l*&��:�l��6�y��'�c���7Y�� �g����J�W�V�9���'s#q�����N���7Ւ��=h�oqА}��Ԫ\?+����D̖�<]L�I�z�6���>��ܶ��,��X�W����6���ɽ�߻� �N����=�/7����u�˝�xtcv�V��1��=���i�zK�4���G�f�9�ƒ�a;,�s%6��'K�-���h���U�Zw����9i'���T��㩎\܉�QV{x����Qp���(>]a
����F��n>�8�6���+�Ӎ�LTw�,����jZ]]�����:4Qψ�W}ĥ^U�+�\��e:ߤ�,'�{��� XY.7y&�sw}�W'c�D,{�P��t��˭�LD��Y�͖�b��_N�m�Z�����4y(�� [lySy�홗z�O�zQ�S�s��gݓǝ�F�5��Dq�K�	�ݕ�-�X����ns�PT�1r�OG�n*%q
�3�{�ų9U���E��<��E���E�|�z]~���~���zs� �m����~Aw��З(��<a�>�'&
c�H�HĠb�)��|�ϧ)|����>w����#m+��}A>���t���[�9b/��ޢ�h����9Y/��Q�}9J/�G���8��hZX9-N�ۅWh����(�~��sZ��J���|N�w�i���vq���+�<}�ne%�AN����Q�� 
F��S~>6�������Pn~lL��C`p�z����Ig�GT����Ώiq*���cA'�'�Z��NB�)�ܰl���	|8������][�o�rB�K�tSĩ��_E~�Ȗ���?ݐc<Z�#����s��*g��>}�r�;1CN��(1"�� ���O�pF�<���b=��BZ�v��v�0s�^���6���Z�&�1�D�X�������(�^	b��@xJ#
�E�.�T�(��
�!��/s�a�B�O�]�u��!���{)tI��t����?�>	=�o�w�h��#�Ч_��SS��?�>��	* &��-<몢hT�@,蝢��#���ݿ���:�ƄZK׺���0�q�a�]TJ5"�7�,1~(�&w�j���e�l:��3�$�^�(1ty�d+�i���dsʑK�;)|��F���a��OlW���V}sđO�]U��1m�Q̡F�j�P��W�R!�,d��bN6
in�N �K��u�)��w�jw����U���<6�T)�9��m�Y̖[T���Xd�g�ɖ�󙘤��(��lm��"->Ś��F�����s�Pn뛢Q
��͌�p��{qĳjQ�$�q��c�o���+�W��ƨ���s*f<��X���V��$1$��N<��fyz��M��&%v�x���"�����+%�B;���M���5Nh�;B-�f��c��)��R�ph��?Eù����r�����f��A��өA
��;7�]�#���P���s�9%]��Z�޼s�i%!�u��d	j�4jW&�}�Vn8�EtW%le����Y�Qv�缓����E��F��Qo�Pv�{uI3=V찔nq�}k���Փ�6��>7�7�O�z��ܠB�*� �P�-7��/��g�!/uw:ʧʚ��ٹ2T��7�xB��^sd��ޕ="9�ge�r7�jdL
:g��Ǒ1��plđۣ�n�m%l$FW���{wnO��S����}���l�U5Td�2�>�
$ڼ�`+x�d���
&J�=T5��"�l�� �Gtv{yzS���n�G֘p-}��
z���W�p���|��F6�~�8GO���(���Ut��<>���v���-��c-8ҏ<��_����������_�T�      %     x��Y�R�H}.���&v#Z�eK~����20=�/e���ȒG���ɒT2�р�d�s�dj/���f���f�_�ϱW�t�e��N��܋��.��l���_�R�e.JɃtǃX���츗)s�>��w�(���D�"�U��#���X\�mU��U�J�=q��Q���,e���v�t���f�,�8��\�OY�]y}�}��j'��Y�V�8�䫽�"�U�b�<L�+f�:��V��űmۺx�^*f���U/�BaST��z͛]�ݶ���Jc�c��\��{������lD�8n���}���N��&��M?���]�ڟ
+�|��"�#��/�-(:�ïv�cnϺX�_ކц�f�6��(X?�D�r�I�e#f9�q\
���bh3����$����or)q�e�^%�K�e�gG!�d�W[������*J�G��������ڻ��s�-�"�)'�xɃ�C�M����x�������1-�`���ZO��l�o|�f�3���_Qjj|�z?�	�Gp�ب"U;`�=v���k��{���%�Y&��WG���o�8�)%�x�� Jr9E0�4#�?�[DX�T?d�C��")�1�E�bD�as@�!a_}��A��\ O�?�\_��X�_�ސ�$���L=����Ɩ��X�XIG���;À��.��|�fˇp͜^��d�N�<*��s�#8�:�Sw�7ĵ����9vnrQ������qu�װx�>�6`���*r��g�������_�k8������T����(�L����0+�J� | �[��|���;}�6v@O�!���A�=����|&��n`8�p�^y��:�#�Y�햳�-�?%|]m������6b�e�M�߈9��
�+s�KU�%��Z�q@��r+�(s��p�B��^�g�th�&����K��`Π�fj��I��\H�Z�9���z(� ��"y� ����%�J7����L%"��m8��(ғƉm8a���|���Z��	T��]]S|vMИ18QQI���*O&V�$��� ��!�v
J�(�SB� �\�T���\%?Ix��%�Iz��x�n.8d]��p��Hӛ,U���,~w%��"ʕ�^[�݆�̀���`L��"�T�@�4~ɳ]ٲ�-�5���㾇�C�b���x�X9,�gǗ� ��(�\#Q�쪩v��Θ�=�Y�?M���Cb�2�O3
�m��Rt�S��1��N����z�E���`��P��|2ۄ�>]�/��&\.p �M-�#������S�{���!j���ũ�,,��ԯ"�*q�R`�U�{~�J6���jJMp{V�l�Ԉ��T�~��v��r�G���;�.�E�aQ[�٦ ヷ�Tu@�V�D�G��c��,pn�+�����;�;Ft��zT���,��譲W�`�Q9���b[�鼀���!�X`aZ��k�c�lW�eql;��oJ�
���W��9R�	f�pt?י�]�'�Yp���r�i-px�a=0�[�ƨ�f�YqT�h!�6Pۅ֏Q1q-������2
���8l��?�;���p�i�g���yƓ�x	�m ;M������IA�\��bCG�[�[/D 4�S�}v���=5��Ҵ�Oʫ!�6��%��R�22r�Xj�G�>�N`�]�M��-�
 y�EɣS,P��![H��O��7)��d�D�(�Y�LZZ��GE��Q�/	i����x�r�s�UQ@���J���U�w�����^�{V��e. q�ū(J�+^Թ4Fbrn��N����j��>`r#Ȼ�	�Yw�_�Cuyhc���}���$Wm�����־8P�>�tv:��M���I*�g ⭮޴]+s~s���}h�,ká�x@��ɉ�����ݿL�_����u�~#u&��3����ڥa̗�	||8G�s�h���2*��ς5���P�<�.�N�[:>���*z��e���ڛ��?�u�$�X�W �f2�vDh��s{�?��
ת}fTR/x���ڶC��!�ycИ��Y����}�A6��m<o�l-��9yg�{�
n�����۩i�Ň��:l&^``@,�����3��c�XQi��|�p�,���E��8T����|v?���]��}��4ZF�pi(����'t�A�y�B^��.0��h찍ȳ����{��ysN��7 �� [�Q�[!S��;[����rv��[k���j�����*�
Zx!���WFՅO��9����S����n{tdXν�^p,������~�6�> 8�V]n$��u �f���W��F�b�>�O<�S�aom���)B5.5o��ϲ{V��� ��W8B�	csj3Sۚ�z���ʡ��úfXd
6�J��X|rP`)���}JT�e�=VSt�UB? �"u0Z���I������i��=��[��!���}����lD��4�Q�V��~�y������)h�C�\$�s���)�k��kڵ��@z=�D��q�%��Sp���T����$јz�E�J���6~z�'��8}�>f*Ep��D���b�'W�T\�أ�To��(��Fc�5N7�@��@��y�z���}�~� �TS��8�"�cpK��l�i��5��9����!Wm]<@?��ʩ����J=����IB����_[C�_�;�F�Hy�M�+O���p1���*4L"���n�7hHJ5�A��}i6��-���m��'���&@��G����xM1!s��AG��LW����)ݩXdy �ԗn4�u�=��<��p8�,iZ�OS*۸3��} �^>L�	�<.�#j���W*2�����)�_���M��2���?��t�2��<� �F¯�X�G��
�j�����oT����CLC��(^@8�y�PvU��ڧ��B-5&���fَH�F%��]�^Ҕ���7����LGS��'�o¶z�n27C�&�m�܎z��չǍ��:*��p̪BϳY.�ϗ���ǨV7�4C7X����z>Y�H�h�����\���ل�d.�M&+j��At�+Lt.����<���.����Я��Әׅ���Vb�X�^W�P+P�}`~F3��(��zSj����r%�C��ئ�q;�v���ɷ@��?O2�<Q׎��>��P��:���1�2=�3dC��NiC�4(#U��N�T��܉��)��=[2�����I�|Iq�<SE�6�~�BCjb�i���sq��kvw%�m�m�A����h΂�%߬Cؼ �X0��� C��q�l�nDwui���B�r��)��!��g���VԆ���h���v�.�v#Ju��;��K��CЀd��\�7��ew��hZ�{A�T��v��:kx6p;�����Z��C����f"��^mʩE��]ѹ�y����%|~���eS�4�ȣm�����B9T�E����L���9�X��qS<}����'T��gO���������Z k`��8�Y�JǉP<\X��GVA������0ΆΐN����r�Sg^H��ɽP"ڒ��XO��0 ��ڊ"��y;�3J$�̵��.K�S����'�$�_��21�����'��ӋD����(����t)��E��Q.5Ë/��=��������y�')�D�~�K\��`�� �F+I�`Lx���++�V�xγ��==8%�
������������M#�р n�˛�B�i�W�#e�Q&;�y�q��Ju�Տ��'�v7-RR�S����f�~�j|w;�l�����f�?lzT������� Li�      &   |  x�}�[�� E��U��QC�;��f	��yM
�Te�c���O����p�2§Y�!(�I(��₂¨c�����a��[b,�ԙ��nH#<��LQԯ��5~�9�Z"�QKl�,���T|B8�,���?�6N^��b3~7��	�d�A�5wSH���n��a]	���\ #ZC����^w��'!��9\����@F�*�G�J���"�,y�1�dE�,�N�#`���wٚ��.�P�}�mӽ��K'.F��0n�r�|	kL'��g�؜�7ܩ�lA��8,��vX���+?�IcwXR��%ѭ��$Z���s�A���{�܊)�r��lP #����_Z�e/]����1P�l\���Puv>eY��,[      (      x��V�r�8��+p�&U"������ZR���^ rD�Z<�0_��tە�\EKB������l=�y,f�,_��M�����ܚpae��}*�[]���VO��PC�]��ͳ��eS�	�y!t�򭥋�NlO�,4��-�n������
�Ju,o�|#us0�l�ύ;���Q�j�L��3{IY�}+N�F>I'�����Ւ��s�����s�߈3_S-+���7���2��W�؛�K�=٣$U'�u�L)�g�u"����$j���p��R�$�IͶִĄ߉�\_�ʃR&4-۶���/υ�l���+Yפ�oW�z��$���胥+�>-S>ulLn���zAM�A25dCQ���>�񭫃��Vس�(@x�����>Ц:����<KO5�G+^���3�{�QVt�Jؓԣ��g��V�:���� �ܤ|9���w��ٝ���m��Ttd�>T'�>Y�� -!��2^a�m��i���*�v��8z���ZQ�fˠk��) �!��șV�����R��� ���_�ْ#-��R$��`������b�zV��ن��jV��~��6�l���,L�f�l#����]������C>��?{0���h8k`���J:o�����+�{�J�B��{�-9�㏹�J��e__.�W��L���6��Ub�"�;"�T-/���&��ٱBB%s�`�����e���̓�i��'������O�?>�۪�F���y��\&c����H��Fg%N,��R%�Qb�����`i+g��W�=�:5���}��a3��	r�"���њb�}m^ǿ�������1%ĉ�W_C��� 7�������4���w}� �M*�zi�?B��lH���{X%F8�����B�5���.��Ŭ���b����c$��	@��aKL��j�t���RLO��n,]��'�`
�le��dk�;�`�ZxV�eG�`	�y%<J�dE�3 �>[͋�l�I};�(��U�}�m���r���۾�`�Ly�Ϩ�M�Qذ'o̳�Ln�D�u���aC `�Aһ��I�D ��nj,1:��W�z�M�i�="v�P+L#Z�ri(/t]|�6d������o���5��W��BBZ	}��g���+ i����S����I���d��l0���+�M ,��&"�Ɯ����d�~
��K�P�9�8��!�\�o:�'��S�M.�Қ�D�*���j���0�h�+R��XH�H`������Ic���G�      *   L   x�m��� ��m/�r��B�u(L�N��+3��eE"	��O�^ܦ�8�}ޔn�#=R/ñ�W�+cp0�G      ,   �   x��н
�0���)���'mG)"VG��\�Ҵ�o�� 6]���9�H�`�h�e��"�����C����<"������A���>-&�:r�Mc�[^�CR�ԺH��aO�5�t�6͠����qR�=	&r��[��.)H����r<���*)�L�P�v�"��y�&�����u�}��]�}&     