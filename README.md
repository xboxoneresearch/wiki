# Xbox One Research Wiki
See https://github.com/xboxoneresearch/wiki/wiki

## Contributing / sending a pull request

1. Create a new repository on your github account. Call it "xboxoneresearch-wiki".
2. Clone the wiki sub-repository to your local machine somewhere:
```
git clone https://github.com/xboxoneresearch/wiki.wiki.git
```

3. Remove the original "origin" remote and add your github repo as new "origin"
```
git remote rm origin
git remote add origin git@github.com:<YOUR_USERNAME>/xboxoneresearch-wiki.git
```

4. Push the upstream state to your wiki
```
git push -u origin master
```

5. Create a branch for your changes, describe your changes in the branch name.
```
git checkout -b my_special_additions
```

6. Make your changes

7. Push your edits
```
git push -u origin my_special_additions
```

8. Send a pull request
