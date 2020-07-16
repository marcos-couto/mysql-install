<map version="1.1.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node BACKGROUND_COLOR="#ff9900" CREATED="1594238578656" ID="ID_1882264012" MODIFIED="1594913464234">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      INSTALA&#199;&#195;O MYSQL 8.0
    </p>
    <p style="text-align: center">
      LINUX FEDORA 32
    </p>
  </body>
</html>
</richcontent>
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1594238792489" ID="ID_141481294" MODIFIED="1594253102733" POSITION="right" TEXT="Procedimento de Instala&#xe7;&#xe3;o">
<node CREATED="1594238834910" ID="ID_1928368445" MODIFIED="1594913522539" TEXT=" 1) ">
<node CREATED="1594240174490" FOLDED="true" ID="ID_1859241423" MODIFIED="1594914924228" TEXT="Selecione e fa&#xe7;a o download &#xa;do release package">
<node CREATED="1594240229761" ID="ID_1872879030" MODIFIED="1594914011003" TEXT=" Instale o release &#xa;package baixado">
<node CREATED="1594913698199" ID="ID_1951746025" MODIFIED="1594913711857" TEXT="$&gt; sudo dnf install mysql80-community-release-fc32-{version-number}.noarch.rpm"/>
</node>
</node>
</node>
<node CREATED="1594240268359" ID="ID_98726538" MODIFIED="1594913716312" TEXT=" 2)">
<node CREATED="1594238904453" FOLDED="true" ID="ID_718266867" MODIFIED="1594914925565" TEXT="Verificar se o reposit&#xf3;rio&#xa; MySQL Yum foi adicionado">
<node CREATED="1594239743874" ID="ID_518422709" MODIFIED="1594913782921" TEXT="$&gt; dnf repolist enabled | grep &quot;mysql.*-community.*">
<node CREATED="1594913845118" ID="ID_1300796948" MODIFIED="1594913956186" TEXT="Checar os sub-reposit&#xf3;rios no reposit&#xf3;rio MySQL Yum &#xa;e ver quais deles est&#xe3;o habilitados ou desabilitados">
<node CREATED="1594913963933" ID="ID_230050137" MODIFIED="1594913976413" TEXT="$&gt; dnf repolist all | grep mysql"/>
</node>
</node>
</node>
</node>
<node CREATED="1594240312215" ID="ID_590883709" MODIFIED="1594914036265" TEXT=" 3)">
<node CREATED="1594239232444" FOLDED="true" ID="ID_1147814198" MODIFIED="1594914921128" TEXT="Instale o MySQL pelo seguinte comando">
<node CREATED="1594240073805" ID="ID_222737113" MODIFIED="1594914083040" TEXT="$&gt; sudo dnf install mysql-community-server"/>
</node>
</node>
<node CREATED="1594239105796" ID="ID_1690014154" MODIFIED="1594914097701" TEXT=" 4)">
<node CREATED="1594239208715" ID="ID_1231624764" MODIFIED="1594915290522" TEXT="Inicie o servidor MySQL ">
<node CREATED="1594240115744" ID="ID_1672934994" MODIFIED="1594914161345" TEXT="$&gt; sudo service mysqld start">
<node CREATED="1594914211303" ID="ID_597960031" MODIFIED="1594914230434" TEXT="Verificar o status do servidor MySQL">
<node CREATED="1594914235026" ID="ID_1896025739" MODIFIED="1594914245664" TEXT="$&gt; sudo service mysqld status"/>
</node>
</node>
<node CREATED="1594240597699" ID="ID_1374764794" MODIFIED="1594914176595" TEXT="ou "/>
<node CREATED="1594914178485" ID="ID_207839840" MODIFIED="1594914193620" TEXT="$&gt; sudo systemctl start mysqld">
<node CREATED="1594914252773" ID="ID_1874620275" MODIFIED="1594914303605" TEXT="Verificar o status do servidor MySQL">
<node CREATED="1594914310838" ID="ID_454232045" MODIFIED="1594914319917" TEXT="$&gt; sudo systemctl status mysqld"/>
</node>
</node>
</node>
</node>
<node CREATED="1594240574939" ID="ID_754741207" MODIFIED="1594914324998" TEXT="  5)">
<node CREATED="1594251992034" FOLDED="true" ID="ID_206970280" MODIFIED="1594914931906" TEXT="Altere a senha o usu&#xe1;rio root ">
<node CREATED="1594252921072" ID="ID_711391563" MODIFIED="1594914407985" TEXT="Verifique o arquivo de log&#xa;">
<node CREATED="1594914412748" ID="ID_1504343442" MODIFIED="1594914424470" TEXT="$&gt; sudo grep &apos;temporary password&apos; /var/log/mysqld.log">
<node CREATED="1594914445694" ID="ID_503172473" MODIFIED="1594914474339" TEXT="$&gt; mysql -uroot -p  &#xa;&#xa;$&gt; ALTER USER &apos;root&apos;@&apos;localhost&apos; IDENTIFIED BY &apos;MyNewPass4!&apos;;"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1594253116048" ID="ID_811407526" MODIFIED="1594915294453" POSITION="right" TEXT="Procedimento de Teste p&#xf3;s Instala&#xe7;&#xe3;o">
<node CREATED="1594253145231" ID="ID_589378656" MODIFIED="1594915295753" TEXT="Executar e gerenciar o processo mysqld">
<node CREATED="1594253266699" ID="ID_656891905" MODIFIED="1594256282743" TEXT=" systemd ">
<node CREATED="1594253330749" ID="ID_1811041720" MODIFIED="1594914526593" TEXT="comando systemctl">
<node CREATED="1594253478535" ID="ID_109931828" MODIFIED="1594914546351" TEXT="sudo systemctl start mysqld"/>
<node CREATED="1594253893654" ID="ID_727425829" MODIFIED="1594914560388" TEXT="sudo systemctl status mysqld"/>
<node CREATED="1594253927022" ID="ID_191391069" MODIFIED="1594914569173" TEXT="sudo systemctl enable mysqld"/>
<node CREATED="1594253956191" ID="ID_1422783011" MODIFIED="1594914579976" TEXT="sudo systemctl stop mysqld"/>
</node>
</node>
<node CREATED="1594914651353" ID="ID_1970772790" MODIFIED="1594914654356" TEXT="ou"/>
<node CREATED="1594253289456" ID="ID_179666003" MODIFIED="1594253323603" TEXT="System V init">
<node CREATED="1594253311856" ID="ID_10413497" MODIFIED="1594253447191" TEXT="comando service">
<node CREATED="1594253478535" ID="ID_1611326832" MODIFIED="1594914754509" TEXT="sudo service mysqld start"/>
<node CREATED="1594253893654" ID="ID_1238757101" MODIFIED="1594914768547" TEXT="sudo service mysqld status"/>
<node CREATED="1594253956191" ID="ID_12559630" MODIFIED="1594914792927" TEXT="sudo systemctl mysqld stop"/>
</node>
</node>
</node>
</node>
<node CREATED="1594238693966" FOLDED="true" ID="ID_692560926" MODIFIED="1594914939217" POSITION="left" TEXT="Coment&#xe1;rios Iniciais">
<node CREATED="1594914817306" ID="ID_1292618784" MODIFIED="1594914848768" TEXT="As instru&#xe7;&#xf5;es a seguir assumem que o MySQL ainda n&#xe3;o est&#xe1; instalado no seu sistema usando um pacote RPM distribu&#xed;do por terceiros;  Siga as etapas abaixo para instalar a vers&#xe3;o GA ( General Availability ) mais recente do MySQL com o reposit&#xf3;rio MySQL Yum:  "/>
</node>
</node>
</map>
