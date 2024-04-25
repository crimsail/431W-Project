PGDMP  :                    |           postgres    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4794                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16594    model    TABLE     
  CREATE TABLE public.model (
    brand character varying(50),
    model character varying(50) NOT NULL,
    processor_name character varying(50),
    processor_gnrtn character varying(50),
    ram_gb character varying(50),
    ram_type character varying(50),
    ssd character varying(50),
    hdd character varying(50),
    os character varying(50),
    os_bit character varying(50),
    graphic_card_gb integer,
    weight character varying(50),
    display_size character varying(50),
    warranty integer,
    "Touchscreen" boolean,
    msoffice boolean,
    latest_price integer,
    old_price integer,
    discount integer,
    star_rating double precision,
    ratings integer,
    reviews integer,
    series character varying(50) DEFAULT 'Missing'::character varying
);
    DROP TABLE public.model;
       public         heap    postgres    false            �            1259    16605 	   processor    TABLE     �   CREATE TABLE public.processor (
    processor_brand character varying(50),
    processor_name character varying(50) NOT NULL,
    processor_gnrtn character varying(50) NOT NULL
);
    DROP TABLE public.processor;
       public         heap    postgres    false            �          0    16594    model 
   TABLE DATA           
  COPY public.model (brand, model, processor_name, processor_gnrtn, ram_gb, ram_type, ssd, hdd, os, os_bit, graphic_card_gb, weight, display_size, warranty, "Touchscreen", msoffice, latest_price, old_price, discount, star_rating, ratings, reviews, series) FROM stdin;
    public          postgres    false    216   L       �          0    16605 	   processor 
   TABLE DATA           U   COPY public.processor (processor_brand, processor_name, processor_gnrtn) FROM stdin;
    public          postgres    false    217   I                   2606    16604    model model_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (model);
 :   ALTER TABLE ONLY public.model DROP CONSTRAINT model_pkey;
       public            postgres    false    216            "           2606    16609    processor processor_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.processor
    ADD CONSTRAINT processor_pkey PRIMARY KEY (processor_name, processor_gnrtn);
 B   ALTER TABLE ONLY public.processor DROP CONSTRAINT processor_pkey;
       public            postgres    false    217    217            #           2606    16610    model processor    FK CONSTRAINT     �   ALTER TABLE ONLY public.model
    ADD CONSTRAINT processor FOREIGN KEY (processor_name, processor_gnrtn) REFERENCES public.processor(processor_name, processor_gnrtn) NOT VALID;
 9   ALTER TABLE ONLY public.model DROP CONSTRAINT processor;
       public          postgres    false    217    216    216    4642    217            �   �  x��[[S�J~��
wB�}�G���Nr�S�����+��ߞ����H؂S!6�|���iN�L�Q�L�|}p��,�E��d�{"N?�9>���������l}���-��JB�Q�i� %����P"��0Mġ&��zݻO|C��"=�a�|h�r���4��![_.����f [�eL�TQ̉!�Pũ"J��:�[e��a��5�-|���L�q��<p��8���Cx_��A���}z�U�r����@�V���d��<��2íi�P��	��_o�"Q�j�b�˱�n���5�2x� ɉ��jCn��"a#����Î)�$Fws��r6W���ѝ̭O�k. Fh�4�8�c�u ߟ��t�z�� ��0���]i �+���s�7�#a���ND�ư���1���kc*���jӧ�@�@i�\J"#8%,&�ކS��#x���O�Ę��������9'3�>����`^��f�.�^>ӱ��URڄ���qh�����X�����!��c�	���t(����@$�
��)x�>P=[|Y���q�Bힷn�QD�h5�n��]7����^ĢX#�8���Ţ5�M2�<fE��
�O#�Fچ�pmS�o7O2O�e��:��)��;dLM�jt�ۇIɤ�G�f2��m:m;qg��2_��ơ
�����>'kj��j��x��(�f[0d�D1%��
D1�-�j�&�UJ�R�]��{���B���$e2����2[�sϓ�ER�������C��)�Z��C���߆�8Wk��H�*ai��G;�=mݕ���i��v)�����8�X�v�8z(�U�O~�oS��ۦ�D�S����*-n3��:�zu3}��sZ�`!ɾ%K�zĨ���	#C��piǠ�N�������<&��`�Y���刎��UF���|��7��ČDJ��
�'Ɛ�V�A��y�-�]��N����ܥ����E����(3�Aj۬r����v<D����}�Xy�X�`$<FY�˺��:�8]�يç9�P�w���,���#�>X[è��#9r���F�ֱ�_�,''�+w�o ��h5��&R�5;U�$M?�meM�x�̦��$��=���O-�!A���%fK$�vF"�����cZ����=�c�ܥIw%0�{�B��W��7�|sB�QG�|��)UC����2:�MƲ�W���X��������ױz���ww�:77Q���P����`<`�18sa�r'*A�lh:W�f�]�~��N��
+�ˀ�t 9M?��mzp��&���=�ZTy�s���XɆ�� 1�����ŗ�Sr�,�_��b�<��=s�3�}��	�CD��ݜ᳋3��+�$2��A�!1�t�5��=R9}�jd̬f'\�2˳51�"��u��U���+O)��G�.��ȧ�W�n�;#����Ե��y�qz����,�1̾i����S����K"ʜ�8�q;��#2�O��^.R{t�ʻ(�q�<��P��.���Is�֕b�m��"���o�]N����|���1|����c;�9b����U�%�gwi��|��М�K�߄�ȲJ�y[�Xw^�N�v�����K�w��K��G��N���Of��yr���

њ[��)�MJq�����_��-��#�f����o���5zΡ�j�n?g������?>�`62�,���z����=�J��Qڭ{�:�)�Q��r1?�����0-aL��4V���\d�6�`a2�c����[��{]�˱b�Klױ�E%C஌wK����J�d��)��}���PM�ԛz��o]�w��
��r�-����~��O㫕�&��ڬ��A��nl�vt�}K���=!e���
��*<ʧqo�0�����������������R��
�L��^nWϭ�����b=2��3���}IW�k���ѷ��ˬ,^:��Z��_�k��X��FÉhP��\����yo���#��x� vvۏ[��j��E�X
��?RFمd@��8����E�������2""Γ�li���]�'�tu�G"�⨙�V��ɸtҤ�{t?��,���U�1��Ez��i�~���A����>�Ppg�_a�?��3�o��>�8��)�v���5�)��携`��{�b.��(�{��͟���-?�ۀ+���V�r}`��z6��f<کt�O�}���Ɣ���u�e�#��"mK�{��0�U8ENy�n2c�*[�|�߿��ζm+�*���tL%�ݷ:eW%q�][A�h�C�@D��T�9�]i��62J���I�`X9i_s�������.k]-[<��e���j2��\ˊl�% K[3Ur�myF�/2x�Y�wzfW�n�Ҽ�e�ƢL�%��ԕ� ��������i����*[��b�ʲr��������jq��3����Cq%��U/�-t̚]HƤs5g�3�^�+ۻ�ں�$�ņ.QF��̋�i�uH��[ݳ���UR�v�.��q%�ws.��{�]Fu
��������&��6]ݳl��@�_	���uu�5㩉��=�J�� G��x�G���ѭlV��q�n[�x�Í=�(�Ӗ�|�m�fo`�#����8Y����!�ǩཕ�vU�;I�A���"yN���LG�w���$�"j�����v�����T�,0)8R�u�=RP�M�u�s�^����}n'$��'�L5G��{��UW髛�x���u\O�F͞��Z�ݽ�\^���%�Ԩ��k��P�s���w&+L�Cx��m{�^E�Km�@~�7[-�n�{���V�_D+�~��a��o�m����˹�\i��J\�a�17�׉z� &�Vwh�/�Ǯ��?q:���XK�݇�ln�K&U��+ L(d�X�qt3_Lp��{5�2��]c�����+�]-9�[+�0jGa[��W������Ai�KS�; &R�?�ڄ�p�_�����i3�'N@/��p�s��ݻ��~~,      �   �   x�m�An�0E��)|�V�5YFE�]D
6V2Kθ����U%&�W���?;/�,y�f3�Kg+��:�>��$R���N���gc1�؂a�`����k<�u����=�� yG��N�gBh�!S�J�(i�$�2bj�������\��u���Ǯ ;���k��c�~�m�"e��,%`����;U��0�����L\_x �$'X6�>�T�i�'��کS�d5���$I� _�;     