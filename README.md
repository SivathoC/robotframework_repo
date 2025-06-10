# robotframework_repo
Please open cmd to the workspace root folder and run the below
1.Ensure that pip setup tools are up to date by running the below on your terminal
	> python -m pip install --upgrade pip setuptools
2. Install poetry 
	> python -m pip install --upgrade poetry	
	Note:	
		- We know that this is a testing framework and will not be packaging and publishing. 
		- We do package some parts of our robot framework to reuse in other projects 
		- Poetry also assist in side stepping some corporate policies regarding blocking access to repositories
3.Create a virtual environment 
	> python -m venv .venv
4. Activate venv environment 
	>  .\.venv\Scripts\Activate.ps1     
5. Initialize browser
	> rfbrowser init     
6. Install robotframework
	> pip install robotframework==7.0.0
7. Install robotframework-browser
	> pip install robotframework-browser==18.2.0
8. Install PyYAML ==6.0.1
	> pip install PyYAML ==6.0.1
9. Install robotframework-autoitlibrary
	> pip install robotframework-autoitlibrary==1.2.9
10.Install rrobotframework-requests
	> pip install robotframework-requests==0.9.7
11. Initialize browser
	> rfbrowser init    
