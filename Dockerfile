FROM cloudbees/jnlp-slave-with-java-build-tools
MAINTAINER Alex Aitken <aaitken@apixio.com>

ENV SBT_VERSION 1.1.6

USER root
RUN npm install -g yarn
RUN apt-get -y update
RUN mkdir -p /home/jenkins/.ivy2/
RUN printf "realm=Sonatype Nexus Repository Manager\n# realm=Artifactory Realm\nhost=repos.apixio.com\nuser=jenkins\npassword=bh29rWAJbc\n" > /home/jenkins/.ivy2/build.credentials
RUN printf "realm=Sonatype Nexus Repository Manager\n# realm=Artifactory Realm\nhost=repos.apixio.com\nuser=jenkins\npassword=bh29rWAJbc\n" > /home/jenkins/.ivy2/release.credentials
RUN mkdir -p /home/jenkins/.m2
RUN printf "<settings>\n	<servers>\n\n		<server>\n			<id>apixio.snapshots.build</id>\n			<username>jenkins</username>\n			<password>bh29rWAJbc</password>\n		</server>\n\n		<server>\n			<id>apixio.releases.build</id>\n			<username>jenkins</username>\n			<password>bh29rWAJbc</password>\n		</server>\n\n		<server>\n			<id>apixio.public.build</id>\n			<username>jenkins</username>\n			<password>bh29rWAJbc</password>\n		</server>\n\n		<server>\n			<id>apixio.thirdparty.build</id>\n			<username>jenkins</username>\n			<password>bh29rWAJbc</password>\n		</server>\n\n		<server>\n			<id>apixio.thirdpartysnapshot.build</id>\n			<username>jenkins</username>\n			<password>bh29rWAJbc</password>\n		</server>\n\n                <server>\n                        <id>apixio.thirdparty</id>\n                        <username>jenkins</username>\n                        <password>bh29rWAJbc</password>\n                </server>\n\n	</servers>\n\n	<profiles>\n		<profile>\n			<id>apixio</id>\n\n			<repositories>\n\n				<repository>\n					<id>apixio.releases.build</id>\n					<releases>\n						<enabled>true</enabled>\n					</releases>\n					<url>https://repos.apixio.com/nexus/repository/releases/\n					</url>\n				</repository>\n\n				<repository>\n					<id>apixio.snapshots.build</id>\n					<snapshots>\n						<enabled>true</enabled>\n					</snapshots>\n					<url>https://repos.apixio.com/nexus/repository/snapshots/\n					</url>\n				</repository>\n\n				<repository>\n					<id>apixio.public.build</id>\n					<snapshots>\n						<enabled>true</enabled>\n					</snapshots>\n					<url>https://repos.apixio.com/nexus/repository/public/\n					</url>\n				</repository>\n\n				<repository>\n					<id>apixio.thirdparty.build</id>\n					<snapshots>\n						<enabled>true</enabled>\n					</snapshots>\n					<url>https://repos.apixio.com/nexus/repository/thirdparty/</url>\n				</repository>\n\n				<repository>\n					<id>apixio.thirdpartysnapshot.build</id>\n					<snapshots>\n						<enabled>true</enabled>\n					</snapshots>\n					<url>https://repos.apixio.com/nexus/repository/thirdpartysnapshot/</url>\n				</repository>\n\n			</repositories>\n\n\n			<pluginRepositories>\n\n				<pluginRepository>\n					<id>apixio.central</id>\n					<url>https://repos.apixio.com/nexus/content/groups/public/\n					</url>\n					<releases>\n						<enabled>true</enabled>\n					</releases>\n					<snapshots>\n						<enabled>true</enabled>\n					</snapshots>\n				</pluginRepository>\n\n			</pluginRepositories>\n\n		</profile>\n	</profiles>\n\n	<activeProfiles>\n		<activeProfile>apixio</activeProfile>\n	</activeProfiles>\n\n</settings>"
# RUN apt-get -y install sbt
# Install sbt
RUN curl -sL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin
RUN chown jenkins:jenkins -R /home/jenkins
USER jenkins
