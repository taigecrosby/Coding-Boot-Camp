#!/bin/bash

# =================================================================================================================================================================================================
# USAGE:
# Change the directories in each path to match how your system is set up.
# There are 4 arguments that must be pas.
# The first 3 apply to which unit, where you want to add the files from git, and then your git commit message. 
# The 4th argument is u for if you want to add each day at a time, just the homework, the whole unit, the whole unit plus the homework, or the solved versions.
# To add the homework solution, you will just have to give the 4th argument the same name as the unit you specify in the 1st argument.
# * NOTE * : When adding solved activities you must add them in order from 1, 2, and then 3. If you try to add 3 without adding 1 or 2 it will add solved for all 3 days.
# * NOTE * : When adding homework solutions, this is designed to add homework solutions after the unit is over so it will add all of solved activities as well if they weren't already posted.
# To add the activity solutions, you will put either 1, 2, or 3 depending on which day you want to add solutions for.
# To add one unsolved day at a time, you will specify "day1", "day2", or "day3" for the 4th argument.
# To add the whole unsolved unit, you will specify "unit" for the 4th argument.
# To add the whole unsolved unit plus unsolved homework, you will specify "unithome" for the 4th argument.
# To add the unsolved homework, you will specify "home" for the 4th argument.
#
# EXAMPLE:
#	For adding a new unit if your current working directory is at the top of your class repository:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Unit 01" "unit"
#
# 	For adding a new unit plus homework if your current working directory is at the top of your class repository:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Unit 01" "unithome"
#
# 	For adding one day at a time if your curent working directory is at the top of your class repository:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Day 1 Unit 01" "day1"
#
# 	For adding homework if your current working directory is at the top of your class repository:
# ~/new_unit "01-Cybersecurity-101" "." "Adding Homework" "home"
#
#	For adding solved activities later on if your current working directory is at the top of your class repository:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved" "1"
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved" "2"
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved" "3"
#
#	For adding the homework solution:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved Homework" "01-Cybersecurity-101"
# =================================================================================================================================================================================================

# =================
# Creating the Unit
# =================

SOURCE=<Path to Instructional Staff Repo>/1-Lesson-Plans/$1
DEST=<Path to Class Repo>/1-Lesson-Plans
NEWDEST=<Path to Class Repo>/1-Lesson-Plans/$1
GITKEEP=<Path to Class Repo>/1-Lesson-Plans/$1/*/*/*
PROJECT=<Path to Class Repo>/1-Lesson-Plans/$1/*/*

if [ $4 = "unit" ]; then
  mkdir <Path to Class Repo>/1-Lesson-Plans
  for dir in $SOURCE; do
    cp -ru $SOURCE $DEST
  done
fi

if [ $4 = "day1" ]; then
  mkdir <Path to Class Repo>/1-Lesson-Plans
  for dir in $SOURCE; do
    cp -ru $SOURCE $DEST
    rm -rf $NEWDEST/2
    rm -rf $NEWDEST/3
  done
fi

if [ $4 = "day2" ]; then
  for dir in $SOURCE; do
    cp -ru $SOURCE $DEST
    rm -rf $NEWDEST/3
  done
fi

if [ $4 = "day3" ]; then
  for dir in $SOURCE; do
    cp -ru $SOURCE $DEST
  done
fi

# ===================================
# Grabbing Slide Links From the Guide
# ===================================

grep "Slides]" $SOURCE/1/*lan.md > $NEWDEST/1/Slides.md
grep "Slides]" $SOURCE/2/*lan.md > $NEWDEST/2/Slides.md
grep "Slides]" $SOURCE/3/*lan.md > $NEWDEST/3/Slides.md
grep "Slides]" $SOURCE/4/*lan.md > $NEWDEST/4/Slides.md

# =====================================
# Deleting Instructional Staff Material
# =====================================

find $NEWDEST -iname sol* -exec rm -rf {} \;
find $NEWDEST -iname *lan.md -exec rm -rf {} \;
find $NEWDEST -iname *_INS_* -exec rm -rf {} \;
find $NEWDEST -iname *assets* -exec rm -rf {} \;
find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
find $NEWDEST -iname *_HW_* -exec rm -rf {} \;
find $NEWDEST -name .ip.swp -exec rm -rf {} \;
find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;

# ===========================================================================
# Adding .gitkeep to all necessary folders to keep the structure looking nice
# ===========================================================================

for dir in $PROJECT; do
  touch $dir/.gitkeep
done

touch $DEST/.gitkeep

for dir in $GITKEEP; do
  touch $dir/.gitkeep
done

# =================================================
# Add Unsolved Homework or Whole Unit Plus Homework
# =================================================


HOMEWORKSRC=<Path to Instructional Staff Repo>/2-Homework/$1
HOMEWORKDEST=<Path to Class Repo>/2-Homework
HOMEGIT=<Path to Class Repo>/*
HOMEWORKGIT=<Path to Class Repo>/2-Homework/*
HOMESOLVE=<Path to Class Repo>/2-Homework/$1

if [ $4 = "home" ]; then
  mkdir <Path to Class Repo>/2-Homework
  for dir in $HOMEWORKSRC; do
   cp -ru $HOMEWORKSRC $HOMEWORKDEST
  done

  find $HOMESOLVE -iname sol* -exec rm -rf {} \;
  find $HOMEWORKDEST -iname *notes* -exec rm -rf {} \;

  for dir in $HOMEGIT; do
    touch $dir/.gitkeep
  done

  for dir in $HOMEWORKGIT; do
    touch $dir/.gitkeep
  done
fi

if [ $4 = "unithome" ]; then
  mkdir <Path to Class Repo>/1-Lesson-Plans
  mkdir <Path to Class Repo>/2-Homework
  for dir in $SOURCE; do
    cp -ru $SOURCE $DEST
    cp -ru $HOMEWORKSRC $HOMEWORKDEST
  done
  grep "Slides]" $SOURCE/1/*lan.md > $NEWDEST/1/Slides.md
  grep "Slides]" $SOURCE/2/*lan.md > $NEWDEST/2/Slides.md
  grep "Slides]" $SOURCE/3/*lan.md > $NEWDEST/3/Slides.md
  grep "Slides]" $SOURCE/4/*lan.md > $NEWDEST/4/Slides.md
  if [ $1 = "20-Red-vs.-Blue-Project" ]; then
    grep "Slides]" $SOURCE/*lan.md > $NEWDEST/Slides.md
  fi
  find $HOMESOLVE -iname sol* -exec rm -rf {} \;
  find $HOMEWORKDEST -iname *notes* -exec rm -rf {} \;
  find $NEWDEST -iname sol* -exec rm -rf {} \;
  find $NEWDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWDEST -iname *_INS_* -exec rm -rf {} \;
  find $NEWDEST -iname *assets* -exec rm -rf {} \;
  find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \;
  find $NEWDEST -name .ip.swp -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
  for dir in $HOMEGIT; do
    touch $dir/.gitkeep
  done

  for dir in $HOMEWORKGIT; do
    touch $dir/.gitkeep
  done
fi

# =====================
# Add Solved Activities
# =====================

SOLVEDSRC=<Path to Instructional Staff Repo>/1-Lesson-Plans/$1
SOLVEDDEST=<Path to Class Repo>/1-Lesson-Plans
NEWSOLVEDDEST=<Path to Class Repo>/1-Lesson-Plans/$1

if [ $4 = "1" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWSOLVEDDEST/2 -iname sol* -exec rm -rf {} \;
  find $NEWSOLVEDDEST/3 -iname sol* -exec rm -rf {} \;
  find $NEWSOLVEDDEST/4 -iname sol* -exec rm -rf {} \;
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \;
  find $NEWDEST -name .ip.swp -exec rm -rf {} \;
  find $NEWSOLVEDDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;
elif [ $4 = "2" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWSOLVEDDEST/3 -iname sol* -exec rm -rf {} \;
  find $NEWSOLVEDDEST/4 -iname sol* -exec rm -rf {} \;
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \;
  find $NEWDEST -name .ip.swp -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;
  find $NEWSOLVEDDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
elif [ $4 = "3" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWSOLVEDDEST/4 -iname sol* -exec rm -rf {} \;
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \;
  find $NEWDEST -name .ip.swp -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;
  find $NEWSOLVEDDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
elif [ $4 = "4" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWDEST -iname *_HW_* -exec rm -rf {} \;
  find $NEWDEST -name .ip.swp -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
  find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;
  find $NEWSOLVEDDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
fi

find $NEWDEST -iname *_INS_* -exec rm -rf {} \;
find $NEWSOLVEDDEST -iname *assets* -exec rm -rf {} \;
find $NEWDEST -name Networking_CTF_Key.xlsx -exec rm -rf {} \;
find $NEWDEST -name Networking_CTF_Version_II_Solution.xlsx -exec rm -rf {} \;
find $NEWSOLVEDDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;

# =====================
# Add Homework Solution
# =====================

if [ $4 = "$1" ]; then
  for dir in $HOMEWORKSRC; do
    cp -ru $HOMEWORKSRC $HOMEWORKDEST
  done
  for dir in $SOURCE; do
    cp -ru $SOURCE $DEST
  done
  find $NEWDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWDEST -name Complete-Cloud-Walkthrough.md -exec rm -rf {} \;
fi

for dir in $PROJECT; do
  touch $dir/.gitkeep
done

touch $DEST/.gitkeep

for dir in $GITKEEP; do
  touch $dir/.gitkeep
done

shopt -s extglob
rm !(README.md)

git add $2 && git commit -m "$3" && git push
