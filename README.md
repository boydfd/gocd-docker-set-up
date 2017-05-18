# gocd docker compose

A easy docker compose to start gocd automatically and easy migrate from original gocd.
 
1. cp pipelines settings from original gocd, for example:
	<pipelines group="blog">
        <pipeline name="blog">
            <materials>
                <git url="https://github.com/boydfd/blog.git" materialName="blog" />
            </materials>
            <stage name="deploy">
                <jobs>
                    <job name="deploy">
                        <tasks>
                            ...
                        </tasks>
                    </job>
                </jobs>
            </stage>
        </pipeline>
    </pipelines>

2. set the name of config to be pipelines.xml and put to root directory of this repo.

3. start init_gocd.sh

4. don't forget to enable agent in gocd page manually.

5. (optional) if you want to ssh remote server through gocd agent, do these:
	1. create directory: `certs`
	2. put you private key in certs directory
	3. then you get this key when agent run task at path: `/home/go/certs`
	4. run `add_shh_host.sh $your-host-name` ($your-host-name should be replace by your truth host name)
