#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY3EX�  �� }���o������    P��Tƌ��jzJ{	OQ���O)�x)�=F4 ?Q2x���<(<P42i��F��FF�@bhɠ��$�5O��6��=�~���4d LLLp�ɦ��dd��&�2dbI$�SiOS��eOʟ��i�6���� �� �0�ͻF-�I��;O�"(Xҵ#�T�Gh�A�+�b��1����$�H��<ו�p�1��������!��	�{7�7&�N$4w.)�W@����2_�Uj[!4�#-�"�G�;�3��Ii�v0D�; ���V9�-��|���!p�BW��NY3=��D��L��Ó�&���Rľ�-��e��Vh�R�����K�4V���/>�?��7I��m���pz�Pz�oj��S�� ��/�����;�Ҵ�"ݶ>n�T4t'Hh"c����`�]v	e9 �UT��w�X�Ɇ%�V��s��=.�WA��k�[׼� �5`�`�Up���v-��&T�m�!}���$Ҭ�r%��]w��#���s�d�f�e���_��"�1�y��1�=g�Fl��|C�瞑�Qeu�y�B�(i4q9A�/���l��6#�f 4<�jIs]_i�� �6�K##&���7SNe)�}9V+�������Pq���WF� �̩�i+��y6+�?̄��-U�BT�D�i����׃����3�jQv��rN�$�'���θ�-&�	�Kf]E���9Z�7#��1���)���m>j7	t����\�e�zz�rʖF����Pu��6#�sӰ����n�)0j�hP��`Awn��
�T/"��Q����ۿ���ݹo�˂�k:���خ�n`fd�=[�e���'б��\rV`���:�F����$���p�;�"h&1�aY ��ϊ12�d��
��ա�X��J�fd��u8�I\fL��0�v¥& ������f�2Yߑ��1\Dخtg�x�W<�1��U�IOb�+s��H3�V�S9ϖ�B��9�&x̌��j2l�lG��D�6Bʖ���*9 ��	���K�$�֐���ܑN$�V2�