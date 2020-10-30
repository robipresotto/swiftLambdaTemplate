include ./Scripts/.config

default: setup

PROJECT_NAME = @read -p "Project name: " projectName
AWS_PROFILE = read -p "AWS profile: " awsProfile

setup:
	${PROJECT_NAME}; \
	${AWS_PROFILE}; \
	./Scripts/clean.sh; \
	./Scripts/save.sh $$projectName $$awsProfile; \
	./Scripts/builder.sh $(projectName) \
	./Scripts/cloudFormation.sh $(projectName) $(awsProfile);
	
build:
	@bash ./Scripts/builder.sh $(projectName);

cloudFormation:
	@bash ./Scripts/cloudFormation.sh $(projectName) $(awsProfile);

deploy:
	@bash ./Scripts/deploy.sh $(projectName) $(awsProfile);
