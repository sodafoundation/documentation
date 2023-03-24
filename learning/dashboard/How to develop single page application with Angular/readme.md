## Installing Visual Studio Code in Ubuntu

STEP 1->Install the dependencies required to install VSCode:

```bash
sudo apt-get install software-properties-common apt-transport-https wget
```
STEP 2->Download and install the Microsoft GPG key:

```baash
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
```

STEP 3->Add the Visual Studio Code repository to your system's package source:

```bash
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
```
STEP 4->Finally, install Visual Studio Code:

```bash
sudo apt-get install code
```
Now you can launch Visual Studio Code by searching for "Visual Studio Code" in the Ubuntu Applications menu, or by running the following command in Terminal:

```bash
code
```

---

## Installing Node.js , NPM (Node Package Manager) and Angular

STEP 1->Install nvm, you should run the install script:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

STEP 2->Install latest LTS (Long Term Support) version:

```bash
nvm install --lts
```

STEP3->Install the Angular CLI (Command Line Interface) globally using NPM

```bash
npm install -g @angular/cli
```

STEP4->Run the Angular CLI


```bash
ng version
```

---

## Create and Run your first angular project:

STEP 1->Create a new Angular project using the `ng new` command.

```bash
ng new <your-app-name>
```

STEP 2->Move to your app directory

```bash
cd <your-app-name>
```

STEP 3->For Running the application run the following command then Open your browser and navigate to http://localhost:4200/.
You should see the default Angular welcome page.

```bash
ng serve
```

## Create Simple Hello World app in Angular

[![Alt text](https://img.youtube.com/vi/U815Ur5IhyQ/0.jpg)](https://www.youtube.com/watch?v=U815Ur5IhyQ)


Download link- https://drive.google.com/file/d/1ccsbeen64POdsQV3EkfsNniHbTc4GoLv/view?usp=sharing

## References

https://github.com/nvm-sh/nvm
https://code.visualstudio.com/

