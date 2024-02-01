--require("lsp")
--Dev_mode_script = "'/usr/lib/jvm/java-8-openjdk-amd64/bin/java -agentlib:jdwp=transport=dt_socket,suspend=y,server=y,address=josh-l-home:36681 -Xmx8g -Dwes.log.dir=/home/josh/WesErrors -Dbuild.compiler=net.compusult.wes.JDTCompiler -Dwes.log.max.filesize=5000 -Dwes.log.level=all -Djava.util.logging.config.file=logging.properties -Dnet.compusult.wes.NodeType=CLIENT -Dscheduler.start=false -Dnet.compusult.wes.core.properties.PropertyOverRide=net.compusult.wes.core.properties.SystemProperty -Dorg.omg.CORBA.ORBClass=com.iona.corba.art.artimpl.ORBImpl -Dlog4j.ignoreTCL=true -Dorg.omg.CORBA.ORBSingletonClass=com.iona.corba.art.artimpl.ORBSingleton  -DORBdomain_name=wes-gias -Dnet.compusult.wes.core.properties.SiteProperties.WES_HOME_DIR=/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/common -DORBconfig_domains_dir=/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/domains -javaagent:/home/josh/.eclipse/org.eclipse.platform_4.26.0_1473617060_linux_gtk_x86_64/configuration/org.eclipse.osgi/1623/0/.cp/lib/javaagent-shaded.jar -Dfile.encoding=UTF-8 -classpath /home/josh/Documents/WES/WebEnterpriseSuite/wes/support/gwt-2.9.0/validation-api-1.0.0.GA-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/compile/lib/3dmap-gwt-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-backend-gwt-1.9.6-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-1.9.6-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-backend-gwt-1.9.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/src:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-orm-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-css-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-dom-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-xml-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-bridge-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-gvt-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-svg-dom-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-i18n-1.11.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-ext-1.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-parser-1.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-util-1.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-script-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-awt-util-1.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-gui-util-1.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/nato.tide.nvg.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/nato-nvg-soapservice-support.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsch-0.1.55.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/WESGenerated-Internal.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/liferay7.3.5-soap-client-generated.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/nitf-java.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/metadata-extractor-2.8.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jasperreports-6.19.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-collections4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/itext-2.1.7.js9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/bin:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/gias/web/WEB-INF/lib/castor-core-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/gias/web/WEB-INF/lib/castor-1.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/art.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/atli2_ip_cio.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/atli2_ip.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/atli2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/codeset.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/concurrency.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/debug.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/ifc.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/ifc-rt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/iiop.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/management.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/mgmt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/omg.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/ots.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/ots-rt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/dcps/dr_idm/support/common/lib/poa.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/compile/lib/portlet-api-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/compile/lib/wsdl4j-1.6.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/lib/spring-mock.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/a2jruntime.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/activation-1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/abdera-1.1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/activemq-all-5.4.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/annogen-0.1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/antlr-2.7.7.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/antlr-complete-3.5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/aopalliance-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/arcgis_agsws_stubs.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/arcgis_ws_runtime.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/asm-9.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axiom-api-1.2.9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axiom-dom-1.2.9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axiom-impl-1.2.9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-adb-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-adb-codegen-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-ant-plugin-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-clustering-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-codegen-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-corba-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-fastinfoset-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-java2wsdl-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-jaxbri-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-jaxws-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-jaxws-api-1.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-jibx-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-json-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-jws-api-1.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-kernel-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-metadata-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-mtompolicy-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-saaj-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-spring-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-transport-http-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-transport-local-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis2-xmlbeans-1.5.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/batik-transcoder-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/bootstrap-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/carol-2.0.5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/CategoryMappingsGen.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/cglib-3.2.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-beanutils-1.7.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-chain-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-cli-1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-math3-3.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-codec-1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-compress-1.8.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-dbcp2-2.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-digester-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-fileupload-1.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-httpclient-3.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-id.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-lang-2.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-lang3-3.3.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-logging-1.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-io-2.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-net-3.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-pool2-2.4.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-validator-1.7.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/connector-1_5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/cql-java.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/cslt-x.thin.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/CSWClient-1.0.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/CSWv2.0.2_with_ebRIM-3.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/dom4j-1.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/dozer-5.2.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/DRIDM-CSW-WCS-Generated.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/DRIDM-CSW-WCSTypes.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdal.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsr-275-1.0-beta-2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/geoapi-2.3-M1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/geoapi-pending-2.3-M1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/geopackage-renderer.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/geronimo-jms_1.1_spec-1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/geronimo-saaj_1.3_spec-1.0.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gflot-3.2.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/GIASTypes.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/GMLGenerated.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-referencing-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-api-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-brewer-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-coverage-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-cql-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-data-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-epsg-extension-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-epsg-hsql-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-jdbc-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-jdbc-oracle-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-jdbc-postgis-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-main-2.7-M2-cslt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-metadata-2.7-M2-cslt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-render-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gt-shapefile-2.7-M2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gwt-dnd-3.3.0-cslt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/HarvestCommon.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/hibernate-commons-annotations-5.0.1.Final.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/hibernate-core-5.0.7.Final.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/hibernate-entitymanager-5.0.7.Final.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/hibernate-jpa-2.1-api-1.0.0.Final.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/hibernate-tools.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/howl-0.1.11.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/httpasyncclient-4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/IASClientInterface.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/IASImageIO.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/icu4j-4_4_1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ImageInfo.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/J2KViewer.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jacob.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jai_codec-1.1.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jai_core-1.1.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jai_imageio.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jandex-2.0.0.Final.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jasperreports-chart-customizers-6.3.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jasperreports-functions-6.19.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/javassist-3.18.1-GA.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jaxb-api-2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsr173_1.0_api.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jaxb-impl-2.1.13.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jaxen-1.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jaxr-api.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jaxrpc.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jboss-logging-3.3.0.Final.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jcommon-1.0.23.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jdbm-0.12.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jdom-1.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jempbox-1.7.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jersey-apache-client4-1.13.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jersey-client-1.13.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jersey-core-1.13.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jersey-multipart-1.13.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jfreechart-1.0.19.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jfreesvg-3.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/joda-time-2.9.9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jotm_iiop_stubs.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xapool-1.5.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jotm.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jotm_jrmp_stubs.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/json_simple.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsr311-api-1.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jstl-1.1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jul-to-slf4j-1.6.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/junit-4.3.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/kdu_jni.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ki-jzkit-hss.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ki-jzkit-iface.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ki-jzkit-z3950.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ki-util.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/KML-2.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/kxml2-min-2.3.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lz4-1.3.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/mail-1.5.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/marklogic-client-api-java-1.0-2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/mex-1.5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/mimepull-1.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/neethi-2.0.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/objectweb-datasource.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ojdbc7.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/opensaml-1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/opensaml-2.3.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/openws-1.3.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.fileupload-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.json-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.rome-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.servlet-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.slf4j-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.spring-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.restlet.ext.xml-2.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/oro-2.0.8.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/OWSExceptionReport-1.0.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/pdfbox-2.0.15.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/plexus-utils-3.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/poi-3.9-20121203.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/poi-excelant-3.9-20121203.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/poi-ooxml-3.9-20121203.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/poi-ooxml-schemas-3.9-20121203.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/poi-scratchpad-3.9-20121203.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/postgis-jdbc-2.1.0SVN.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/postgresql-42.2.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/resolver-2.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/rome-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/rome-modules-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sanselan-0.97-incubator.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/SASParserV0.0.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/saxon-9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/saxon-dom-9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sdoapi.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sdoutl.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/serializer-2.7.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/SOSCapabilitiesParser-1.0.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sqljdbc41.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/standard-1.1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/stax-api-1.0.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/stringtemplate-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/struts-1.2.7.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/tyrex-1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/units.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/vecmath-1.3.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/velocity-1.5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wes-collections-xml-app.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/WESGeoRSSBuilder.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wes-MapManager.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wes-Security.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wes-XPathParser.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/WFS-1.1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wfs-gensrc.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/woden-1.0-incubating-M7b.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wsdl4j-1.6.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wss4j-1.5.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/wstx-asl-3.2.9.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xalan-2.7.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xbean-2.5.1-cslt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xbean_xpath-2.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xercesImpl-2.9.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xk72gifencoder.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xml-apis-1.3.04.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmlbeans-qname-2.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xml-resolver-1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/XmlSchema-1.4.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmlsec-1.4.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmltooling-1.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xuggle-xuggler-arch-x86_64-rhel5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xuggle-xuggler-noarch.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/zoom-java.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/logback-classic-1.1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/logback-core-1.1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/svgSalamander-tiny.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gwt-image-loader-1.1.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/guava-14.0.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spatial4j-0.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/rhino-js-1.7.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-analyzers-common-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-analyzers-kuromoji-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-analyzers-phonetic-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-backward-codecs-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-codecs-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-core-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-expressions-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-grouping-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-highlighter-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-join-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-memory-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-misc-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-queries-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-queryparser-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-spatial-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lucene-suggest-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/noggit-0.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/solr-core-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/solr-solrj-5.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/zookeeper-3.4.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/httpclient-4.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/httpcore-4.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/httpmime-4.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/httpcore-nio-4.4.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sqlite-jdbc-3.8.10.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/javapng-2.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/natty-0.12.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ical4j-2.0-beta1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/org.eclipse.paho.client.mqttv3-1.0.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/imageio-core-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/imageio-jpeg-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/common-image-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/common-io-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/common-lang-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/imageio-metadata-3.2.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmpcore-5.1.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsoup-1.10.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsinterop-annotations-2.0.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jsinterop-annotations-2.0.0-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/gwt-2.9.0/requestfactory-server.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/gwt-2.9.0/gwt-dev.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/gwt-2.9.0/gwt-user.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/gwt-2.9.0/validation-api-1.0.0.GA.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/compile/lib/tomcat-dbcp-8.5.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/monte-cc-7.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/axis.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/commons-discovery-0.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/liferay/portal-impl-7.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/liferay/portal-kernel-7.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lwjgl_util-2.9.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lwjgl-2.9.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lwjgl-platform-2.9.2-natives-linux.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lwjgl-platform-2.9.2-natives-osx.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/lwjgl-platform-2.9.2-natives-windows.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/3dmap-gwt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/fluent-hc-4.5.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-1.9.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-backend-headless-1.9.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-backend-lwjgl-1.9.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-freetype-1.9.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-freetype-platform-1.9.6-natives-desktop.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-platform-1.9.6-natives-desktop.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-tools-1.9.6-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/gdx-tools-1.9.6.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jinput-2.0.5.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jinput-platform-2.0.5-natives-linux.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jinput-platform-2.0.5-natives-osx.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jinput-platform-2.0.5-natives-windows.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jlayer-1.0.1-gdx.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jna-4.1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jna-platform-4.1.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jorbis-0.0.17.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jutils-1.0.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/tika-core-1.16.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/JRI.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/JRIEngine.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/json-20180813.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jta-1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/caffeine-2.6.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/WESGenerated-External.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/hsqldb-1.8.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jts-core-1.15.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/mapbox-vector-tile-3.0.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/protobuf-java-3.6.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jts-1.13.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-aop-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-aspects-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-beans-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-context-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-context-indexer-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-context-support-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-core-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-expression-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-instrument-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-jcl-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-jdbc-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-jms-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-messaging-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-oxm-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-test-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-tx-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-web-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-webflux-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-webmvc-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/spring-websocket-5.1.3.RELEASE.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ehcache-3.4.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jackson-annotations-2.9.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jackson-core-2.9.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jackson-databind-2.9.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/okhttp-3.9.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmlunit-core-2.5.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmlunit-legacy-2.5.1-sumo.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmlunit-legacy-2.5.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmlunit-matchers-2.5.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/c3p0-0.9.1.1.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/quartz-2.2.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/quartz-jobs-2.2.3.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/support/compile/lib/catalina.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/snakeyaml-1.24.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/3dmap-gwt-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/fontbox-2.0.15.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/graphics2d-0.22.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jackson-databind-2.8.8-sources.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/openhtmltopdf-core-0.0.1-RC21-SNAPSHOT.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/openhtmltopdf-objects-0.0.1-RC21-SNAPSHOT.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/openhtmltopdf-pdfbox-0.0.1-RC21-SNAPSHOT.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/s57Library.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/xmpbox-2.0.15.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sevenzipjbinding-all-platforms-9.20-2.00beta.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/sevenzipjbinding.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/laszip4j-0.8-SNAPSHOT.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/slf4j-api-1.7.7.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ffmpeg-4.3.1-1.5.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ffmpeg-4.3.1-1.5.4-linux-x86_64.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ffmpeg-4.3.1-1.5.4-windows-x86_64.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/ffmpeg-platform-4.3.1-1.5.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jmisb-api-1.10.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/jmisb-core-1.10.0.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/javacpp-1.5.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/javacpp-1.5.4-linux-x86_64.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/javacpp-1.5.4-windows-x86_64.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/javacpp-platform-1.5.4.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/aws-java-sdk-1.12.159.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/log4j-1.2-api-2.17.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/log4j-api-2.17.2-cslt.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/log4j-core-2.17.2.jar:/home/josh/Documents/WES/WebEnterpriseSuite/wes/web/WEB-INF/lib/log4j-slf4j18-impl-2.17.2.jar net.compusult.wes.GWTWrapper -war build/webapps/wes -bindAddress 0.0.0.0 -server net.compusult.wes.CSLTJettyLauncher -startupUrl 'http://josh-l-home:8888/wes/Client/index.jsp?entryPoint=ES_ANALYST' net.compusult.wes.Client net.compusult.wes.admin.AdminClient net.compusult.wes.admin.WMSAdmin'"}}

local server_dev_mode_script = "/home/josh/Documents/WES/WebEnterpriseSuite/serverDebugDevMode.sh"
local client_dev_mode_script = "/home/josh/Documents/WES/WebEnterpriseSuite/clientDebugDevMode.sh"

local M = {}

M.run_server_dev_mode = function()
	vim.cmd("term " .. server_dev_mode_script)
end
M.run_client_dev_mode = function()
	vim.cmd("term " .. client_dev_mode_script)
end
local dap = require("dap")
dap.set_log_level("TRACE")

function attach_to_debug()
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Attach to GWT",
			projectName = "WebEnterpriseSuite",
			hostName = "127.0.0.1",
			port = "5005",
		},
	}
	dap.continue()
end

return M