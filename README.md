# Xbox One Research Wiki

## Access the wiki
Github wiki: https://github.com/xboxoneresearch/wiki/wiki
Selfhosted: https://wiki.xosft.dev

## Fetching a local wiki copy
```
git clone https://github.com/xboxoneresearch/wiki.wiki.git
```

## Contributing via issues
1. Write some info for the wiki in markdown
2. Open an issue on this repo and post your changes

## Contributing by forking

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

8. Open an issue on this repo and link us to your edited fork. Please also briefly describe the changes you made
