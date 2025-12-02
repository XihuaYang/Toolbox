import os
import re

pattern = re.compile(r'(release.+)|(master)|(main)|(prod)|(stag)|(dev)|(production)|(staging)|(develop)|(hotfix)')

branches = os.popen('git branch').read().split('\n')
for branch in branches:
  if branch.startswith('*'):
    # Skip current branch
    continue
  branch = branch.strip()
  if not branch or pattern.match(branch):
    # Skip protected branches and empty lines
    continue
  print('Delete branch? (y/n) {}'.format(branch))
  choice = input().lower()
  if choice == 'y':
    existed_in_local = os.popen('git branch --list {}'.format(branch)).read().strip()
    if existed_in_local:
      os.system('git branch -D {}'.format(branch))
      print('Delete local branch {}'.format(branch))
    else:
      os.system('echo "Local branch {} does not exist"'.format(branch))
    existed_in_remote = os.popen('git ls-remote --heads origin {}'.format(branch)).read().strip()
    if existed_in_remote:
      os.system('git push origin --delete {}'.format(branch))
      print('Delete remote branch {}'.format(branch))
    else:
      os.system('echo "Remote branch {} does not exist"'.format(branch))
  print()
