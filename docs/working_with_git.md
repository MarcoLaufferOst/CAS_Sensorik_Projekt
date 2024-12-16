# Git Workflow for the Project

This document describes a general workflow for working with Git. This workflow allows contributors to work independently on different branches, while the maintainer is responsible for merging changes.

---

## **Key Principles**

1. **Branching**:  
   Branches are independent development tracks that allow new features or bug fixes to be developed without affecting the main branch (`main`).  
   - Each contributor creates their own feature branch based on `main`.
   - The maintainer is responsible for merging changes into the `main` branch.

2. **Feature Branches**:  
   Each new task or feature should be developed in its own branch to keep the codebase clean and organized.

3. **Regular Updates**:  
   It is important to pull changes from the `main` branch into your feature branch to minimize conflicts.

---

## **Workflow Instructions**

### **1. Clone the Project**
The project is hosted on GitHub. You can clone the repository to your computer using the following command:  
```bash
git clone <repository_url>
```

### **2. Create a New Branch**
Create a new branch based on `main` to work on your feature:  
```bash
git checkout -b <feature-branch-name>
```

### **3. Make Changes**
Work on the files and save your changes.

### **4. Stage Changes**
Add the modified files to the staging area:  
```bash
git add <filename>  # Or for all files: git add .
```

### **5. Commit Changes**
Save the changes to the local repository with a description:  
```bash
git commit -m "Short description of the change"
```

### **6. Push Changes to GitHub**
Push your feature branch to GitHub:  
```bash
git push origin <feature-branch-name>
```

### **7. Pull Changes from the `main` Branch**
To ensure your feature branch is up-to-date, fetch the latest changes from the `main` branch and merge them into your branch:  
```bash
git checkout main  # Switch to the main branch
```
```bash
git pull origin main  # Update the main branch
```
```bash
git checkout <feature-branch-name>  # Switch back to your feature branch
```
```bash
git merge main  # Merge changes from main
```

---

## **Additional Notes**

- **Avoid Conflicts**:  
   Regularly update your feature branch with the latest changes from the `main` branch.

- **Branch Names**:  
   Use meaningful branch names that describe the feature or task (e.g., `feature/login-page`).

- **Check Current Branch**:  
   You can check which branch you are currently on with the following command:  
   ```bash
   git branch
   ```

---

### **Summary of Key Commands**
| Action                        | Command                          |
|-------------------------------|-----------------------------------|
| Clone the repository          | `git clone <repository_url>`     |
| Create a new branch           | `git checkout -b <branch-name>`  |
| Switch to a branch            | `git checkout <branch-name>`     |
| Stage changes                 | `git add <filename>`             |
| Commit changes                | `git commit -m "Description"`   |
| Push changes                  | `git push origin <branch-name>`  |
| Pull changes from main        | `git merge main`                 |
| Show current branch           | `git branch`                     |

---

## **Example Workflow**

Let’s illustrate the workflow with a practical example:

### **Scenario**
We need to develop a Passgate. This involves creating a feature branch, implementing the schematic and simulation, conducting a review, and finalizing with a layout and design rule checks (DRCs).

### **Steps**

1. **Create a feature branch:**
   ```bash
   git checkout -b feature/passgate
   ```

2. **Develop the schematic and simulation:**
   - Work on the schematic and simulation files.
   - Stage and commit the changes:
     ```bash
     git add schematic_file.sch symbol_files.sym tb_schematic_file.sch 
     git commit -m "Add schematic and simulation for Passgate"
     ```
   - Push the branch to GitHub:
     ```bash
     git push origin feature/passgate
     ```

3. **Review:**
   - Conduct a code and design review. Incorporate feedback as necessary.

4. **Develop the layout:**
   - Work on the layout files.
   - Stage and commit the changes:
     ```bash
     git add layout_file
     git commit -m "Add layout for Passgate"
     ```

5. **Perform DRC checks:**
   - Ensure all DRCs pass.
   - Commit any final changes:
     ```bash
     git commit -m "Fix DRC issues for Passgate"
     ```

6. **Merge the feature branch:**
   - Once everything is complete and reviewed, the maintainer merges the branch into `main`.

### **Visualizing the Workflow**

```plaintext
(main)       o---o---o---o----------------------o  (main branch)
                \                            /
(feature)        o---o---o---o---o---o---o---o  (feature/passgate)
                  schematic   layout    DRC fixes
```

Each `o` represents a commit, with changes staged, committed, and pushed according to the described steps.

---

This workflow provides a clear and structured approach for developing features while maintaining a clean and organized codebase. Good luck!
