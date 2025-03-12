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
BZh91AY&SY��  ���EP���onޮ����    P-�N�s�x%&�l������='�M�fjA�3H�i�fF��4@�Bz#iOM�4ɚi 4d�10�����$��L��I�F�~��M��Ti�bF�H4 ��1�        P��H�M��'�      �@~?ǃr3��g0՗<Њ5�wbŌ��z��mz-w�ϫ^3n3��g�y����I!m�^�P�r��]+%�iqz�\�Ռ�j}�2Tg��s���)��%��u�<K�>ܤ������i̰'�s�Ml`ҷw8d,�^m�S�.��M��Dl���!�Z��^���~)�CGH��q�Z��55Q��V�:ٶ�בʷ�ߦ�لJ�ʀʗ��.c��ĕ�h�;I����V�(.O6!0�h�S�0���D��kް�zHV�c�is�1)�	%��"�t��L�����I�x91d����MR���R�:��`T>�Ά���0�����3�,E�I�$�Hg�U81�Y�Ae�L��9茆����B	sܺ���N��ӌ7���W��]�Ƈ��� a�R��	��-,�&>�e2�����7��D3���e����U@��U[jf��!$�����&	J@��ܪ��o�z��YP�0��/>,��DG�m�oIo��@�C�1f�d�68<�Z�����DTO)-%r�buNf[��c�h��"�0�An�'a�.�W��AYr�4Nڢs���� Y�A��Q�����c���ɥ'#��&�n��T�m*h �>D�ݩ  1�6E'P���/E�l��̱2�i��,V����@!
�)�%�+`a$��*�+�TK��.҄ARzT�9E]rE[.#�@��~R�sOh |@ ��H�
 ���`