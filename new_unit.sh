#!/bin/bash

# Replace the paths in the lines that contain CHANGE ME to match the paths of your local Instructor/Student repo's


echo "What unit do you want to upload?"
echo "** Use full unit name ** Example: 01-Cybersecurity-101"
read var1
echo "Where is your git add location?"
echo " ** Use the path to add everything from ** Example: '.' would be from your current directory"
read var2
echo "What is your commit message?"
read var3
echo "What do you want to upload?"
echo """** OPTIONS ** 
unit - add whole unsolved unit without homework
unithome - add whole unsolved unit with homework
day1 - add day 1 unsolved
1 - add day 1 solved
day2 - add day 2 unsolved
2 - add day 2 solved
day3 - add day 3 unsolved
3 - add day 3 solved
day4 - add day 4 unsolved
4 - add day 4 solved
home - add just unsolved homework
homesol - add homework solution
"""
read var4

SRC=PATH TO INSTRUCTOR REPO/1-Lesson-Plans/$var1 # CHANGE ME
DEST=PATH TO STUDENT REPO/1-Lesson-Plans # CHANGE ME
NEWDEST=PATH TO STUDENT REPO/1-Lesson-Plans/$var1 # CHANGE ME
HOMESRC=PATH TO INSTRUCTOR REPO/2-Homework/$var1 # CHANGE ME
HOMEDEST=PATH TO STUDENT REPO/2-Homework # CHANGE ME
NEWHOMEDEST=PATH TO STUDENT REPO/2-Homework/$var1 # CHANGE ME

mkdir PATH TO STUDENT REPO/1-Lesson-Plans 2>/dev/null # CHANGE ME
mkdir PATH TO STUDENT REPO/2-Homework 2>/dev/null # CHANGE ME

if [ $var4 = "unit" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST -iname sol* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *assets* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  grep -i 'slides]' $SRC/1/*lan.md 2>/dev/null > $NEWDEST/1/Slides.md 
  grep -i 'slides]' $SRC/2/*lan.md 2>/dev/null > $NEWDEST/2/Slides.md 
  grep -i 'slides]' $SRC/3/*lan.md 2>/dev/null > $NEWDEST/3/Slides.md 
  grep -i 'slides]' $SRC/4/*lan.md 2>/dev/null > $NEWDEST/3/Slides.md 
  if [ $var1 = "13-Elk-Stack-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md 2>/dev/null > $NEWDEST/Slides.md
  fi
  if [ $var1 = "20-Red-vs.-Blue-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md 2>/dev/null > $NEWDEST/Slides.md
  fi
  if [ $var1 = "24-Final-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md 2>/dev/null > $NEWDEST/Slides.md
  fi
fi

if [ $var4 = "day1" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST/1 -iname sol* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -iname *assets* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/1 -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  grep -i 'slides]' $SRC/1/*lan.md 2>/dev/null > $NEWDEST/1/Slides.md 
  rm -rf $NEWDEST/2
  rm -rf $NEWDEST/3
  rm -rf $NEWDEST/4
fi

if [ $var4 = "day2" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST/2 -iname sol* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -iname *assets* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/2 -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  grep -i 'slides]' $SRC/2/*lan.md 2>/dev/null > $NEWDEST/2/Slides.md
  rm -rf $NEWDEST/3
  rm -rf $NEWDEST/4
fi

if [ $var4 = "day3" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST/3 -iname sol* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -iname *assets* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/3 -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  grep -i 'slides]' $SRC/3/*lan.md 2>/dev/null > $NEWDEST/3/Slides.md
  rm -rf $NEWDEST/4
fi

if [ $var4 = "day4" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST/4 -iname sol* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -iname *assets* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST/4 -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  grep -i 'slides]' $SRC/4/*lan.md 2>/dev/null > $NEWDEST/4/Slides.md
fi

if [ $var4 = "home" ]; then
  for i in $HOMESRC; do
    cp -ru $HOMESRC $HOMEDEST
  done
  find $NEWHOMEDEST -iname sol* -exec rm -rf {} \; 2>/dev/null
fi

if [ $var4 = "1" ]; then
  if [ -d "$NEWDEST/2" ]; then
    for i in $SRC; do
      cp -ru $SRC $DEST
    done
    find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST/2 -iname sol* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST/3 -iname sol* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST/4 -iname sol* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name .ip.swp -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  else
    for i in $SRC; do
      cp -ru $SRC $DEST
    done
    find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
    rm -rf $NEWDEST/2
    rm -rf $NEWDEST/3
    rm -rf $NEWDEST/4
  fi
  if [[ -n $(find $SRC/1 -iname sol*) ]]; then
    :
  else
    echo -e "\n *** THERE IS NO SOLUTION FOR THIS DAY *** \n"
  fi
fi

if [ $var4 = "2" ]; then
  if [ -d "$NEWDEST/3" ]; then
    for i in $SRC; do
      cp -ru $SRC $DEST
    done
    find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST/3 -iname sol* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST/4 -iname sol* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name .ip.swp -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  else
    for i in $SRC; do
      cp -ru $SRC $DEST
    done
    find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
    rm -rf $NEWDEST/3
    rm -rf $NEWDEST/4
  fi
  if [[ -n $(find $SRC/2 -iname sol*) ]]; then
    :
  else
    echo -e "\n *** THERE IS NO SOLUTION FOR THIS DAY *** \n"
  fi
fi

if [ $var4 = "3" ]; then
  if [ -d "$NEWDEST/4" ]; then
    for i in $SRC; do
      cp -ru $SRC $DEST
    done
    find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST/4 -iname sol* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name .ip.swp -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
    find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  else
    for i in $SRC; do
      cp -ru $SRC $DEST
    done
    find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
    rm -rf $NEWDEST/4
  fi
  if [[ -n $(find $SRC/3 -iname sol*) ]]; then
    :
  else
    echo -e "\n *** THERE IS NO SOLUTION FOR THIS DAY *** \n"
  fi
fi

if [ $var4 = "4" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  if [[ -n $(find $SRC/4 -iname sol*) ]]; then
    :
  else
    echo -e "\n *** THERE IS NO SOLUTION FOR THIS DAY *** \n"
  fi
fi

if [ $var4 = "unithome" ]; then
  for i in $SRC; do
    cp -ru $SRC $DEST
  done
  find $NEWDEST -iname sol* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *lan.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *assets* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name .ip.swp -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
  grep -i 'slides]' $SRC/1/*lan.md 2>/dev/null > $NEWDEST/1/Slides.md
  grep -i 'slides]' $SRC/2/*lan.md 2>/dev/null > $NEWDEST/2/Slides.md
  grep -i 'slides]' $SRC/3/*lan.md 2>/dev/null > $NEWDEST/3/Slides.md
  grep -i 'slides]' $SRC/4/*lan.md 2>/dev/null > $NEWDEST/4/Slides.md
  if [ $var1 = "13-Elk-Stack-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md 2>/dev/null > $NEWDEST/Slides.md
  fi
  if [ $var1 = "20-Red-vs.-Blue-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md 2>/dev/null > $NEWDEST/Slides.md
  fi
  if [ $var1 = "24-Final-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md 2>/dev/null > $NEWDEST/Slides.md
  fi
  for i in $HOMESRC; do
    cp -ru $HOMESRC $HOMEDEST
  done
  find $NEWHOMEDEST -iname sol* -exec rm -rf {} \; 2>/dev/null
fi 

if [ $var4 = "homesol" ]; then
  if [[ -n $(find $HOMESRC -iname sol*) ]]; then
    :
  else
    echo -e "\n *** THERE IS NO SOLUTION FOR THIS UNIT *** \n"
  fi
  for i in $HOMESRC; do
    cp -ru $HOMESRC $HOMEDEST
  done
fi

find $NEWDEST -iname *_INS_* -exec rm -rf {} \; 2>/dev/null
find $NEWDEST -iname *assets* -exec rm -rf {} \; 2>/dev/null
find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \; 2>/dev/null
find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \; 2>/dev/null
find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \; 2>/dev/null

find $DEST -type d -exec touch {}/.gitkeep \; 2>/dev/null
find $HOMEDEST -type d -exec touch {}/.gitkeep \; 2>/dev/null

shopt -s extglob
rm !(README.md) 2>/dev/null

git add $var2 && git commit -m "$var3" && git push
