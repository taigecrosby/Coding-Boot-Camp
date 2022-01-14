#!/bin/bash

# Navigate into your student repo and use the following syntax:
# If this script is placed one directory up from the student repo use:
#
# ../new_unit.sh "<unit>" "<git add path>" "<commit message>" "<option>"
#
#
# *** NOTE ***
# Change lines that contain "CHANGE THIS" to match your instructor and student repo paths.
#
#
# *** Example usages ***:
#
#
# For adding the whole unsolved unit without homework:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Unit 01" "unit"
#
# For adding the whole unit with homework:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Unit 01" "unithome"
#
# For adding day 1 unsolved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Day 1" "day1"
#
# For adding day 1 solved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Solved Day 1" "1"
#
# For adding day 2 unsolved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Day 2" "day2"
#
# For adding day 2 solved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Solved Day 2" "2"
#
# For adding day 3 unsolved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Day 3" "day3"
#
# For adding day 3 solved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Solved Day 3" "3"
#
# For adding day 4 unsolved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Day 4" "day4"
#
# For adding Day 4 solved:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Solved Day 4" "4"
#
# For adding just homework, no unit:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Homework Unit 01" "home"
#
# For adding homework solution:
# ../new_unit.sh "01-Cybersecurity-101" "." "Adding Homework Solution" "homesol"


SRC=PATH TO INSTRUCTOR REPO/1-Lesson-Plans/$1  # CHANGE THIS
DEST=PATH TO STUDENT REPO/1-Lesson-Plans  # CHANGE THIS
NEWDEST=PATH TO STUDENT REPO/1-Lesson-Plans/$1  # CHANGE THIS
HOMESRC=PATH TO INSTRUCTOR REPO/2-Homework/$1  # CHANGE THIS
HOMEDEST=PATH TO STUDENT REPO/2-Homework  # CHANGE THIS
NEWHOMEDEST=PATH TO STUDENT REPO/2-Homework/$1  # CHANGE THIS

mkdir PATH TO STUDENT REPO/1-Lesson-Plans 2>/dev/null  # CHANGE THIS
mkdir PATH TO STUDENT REPO/2-Homework 2>/dev/null  # CHANGE THIS

if [ $4 = "unit" ]; then
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
  grep -i 'slides]' $SRC/1/*lan.md > $NEWDEST/1/Slides.md
  grep -i 'slides]' $SRC/2/*lan.md > $NEWDEST/2/Slides.md
  grep -i 'slides]' $SRC/3/*lan.md > $NEWDEST/3/Slides.md
  grep -i 'slides]' $SRC/4/*lan.md > $NEWDEST/3/Slides.md
  if [ $1 = "13-Elk-Stack-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md > $NEWDEST/Slides.md
  fi
  if [ $1 = "20-Red-vs.-Blue-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md > $NEWDEST/Slides.md
  fi
  if [ $1 = "24-Final-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md > $NEWDEST/Slides.md
  fi
fi

if [ $4 = "day1" ]; then
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
  grep -i 'slides]' $SRC/1/*lan.md > $NEWDEST/1/Slides.md
  rm -rf $NEWDEST/2
  rm -rf $NEWDEST/3
  rm -rf $NEWDEST/4
fi

if [ $4 = "day2" ]; then
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
  grep -i 'slides]' $SRC/2/*lan.md > $NEWDEST/2/Slides.md
  rm -rf $NEWDEST/3
  rm -rf $NEWDEST/4
fi

if [ $4 = "day3" ]; then
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
  grep -i 'slides]' $SRC/3/*lan.md > $NEWDEST/3/Slides.md
  rm -rf $NEWDEST/4
fi

if [ $4 = "day4" ]; then
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
  grep -i 'slides]' $SRC/4/*lan.md > $NEWDEST/4/Slides.md
fi

if [ $4 = "home" ]; then
  for i in $HOMESRC; do
    cp -ru $HOMESRC $HOMEDEST
  done
  find $NEWHOMEDEST -iname sol* -exec rm -rf {} \; 2>/dev/null
fi

if [ $4 = "1" ]; then
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

if [ $4 = "2" ]; then
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

if [ $4 = "3" ]; then
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

if [ $4 = "4" ]; then
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

if [ $4 = "unithome" ]; then
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
  grep -i 'slides]' $SRC/1/*lan.md > $NEWDEST/1/Slides.md
  grep -i 'slides]' $SRC/2/*lan.md > $NEWDEST/2/Slides.md
  grep -i 'slides]' $SRC/3/*lan.md > $NEWDEST/3/Slides.md
  grep -i 'slides]' $SRC/4/*lan.md > $NEWDEST/4/Slides.md
  if [ $1 = "13-Elk-Stack-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md > $NEWDEST/Slides.md
  fi
  if [ $1 = "20-Red-vs.-Blue-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md > $NEWDEST/Slides.md
  fi
  if [ $1 = "24-Final-Project" ]; then
    grep -i 'slides]' $SRC/*lan.md > $NEWDEST/Slides.md
  fi
  for i in $HOMESRC; do
    cp -ru $HOMESRC $HOMEDEST
  done
  find $NEWHOMEDEST -iname sol* -exec rm -rf {} \; 2>/dev/null
fi 

if [ $4 = "homesol" ]; then
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

git add $2 && git commit -m "$3" && git push
