#!/bin/bash

# =================================================================================================================================================================================================
# USAGE:
# Change the directories in each path to match how your system is set up.
# There are 3 - 4 arguments that must be passed.
# The first 3 apply to which unit, where you want to add the files from git, and then your git commit message. 
# The 4th argument applies to when you want to add the solved versions of the activities. You will put "1" "2" or "3" for this depending on which day you're adding solved for.
# Simply don't put a 4th argument when running the script if you don't want to add solved versions yet.
# To add the homework solution, you will just have to give the 4th argument the same name as the unit you specify in the 1st argument.
# * NOTE * : When adding solved activities you must add them in order from 1, 2, and then 3. If you try to add 3 without adding 1 or 2 it will add solved for all 3 days.
# * NOTE * : When adding homework solutions, this is designed to add homework solutions after the unit is over so it will add all of solved activities as well if they weren't already posted.
# EXAMPLE:
#	For adding a new unit if your current working directory is at the top of your class repository:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Unit 01"
#
#	For adding solved activities later on if your current working directory is at the top of your class repository:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved" "1"
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved" "2"
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved" "3"
#
#	For adding the homework solution:
# ~/new_unit.sh "01-Cybersecurity-101" "." "Adding Solved Homework" "01-Cybersecurity-101"
# =================================================================================================================================================================================================

# ==========================================
# Creating and Adding the Full Unsolved Unit
# ==========================================

SOURCE=~/<path to instructional staff github repo>/1-Lesson-Plans/$1
DEST=~/<path to your class repo>/1-Lesson-Plans
NEWDEST=~/<path to your class repo>/1-Lesson-Plans/$1
GITKEEP=~/<path to your class repo>/1-Lesson-Plans/$1/*/*/*
PROJECT=~/<path to your class repo>/1-Lesson-Plans/$1/*/*

mkdir ~/<path to your class repo>/1-Lesson-Plans

for dir in $SOURCE; do
  cp -ru $SOURCE $DEST
done

find $NEWDEST -iname sol* -exec rm -rf {} \;
find $NEWDEST -iname *lan.md -exec rm -rf {} \;
find $NEWDEST -iname *_INS_* -exec rm -rf {} \;
find $NEWDEST -iname *assets* -exec rm -rf {} \;

# ====================================
# Grabbing Slide Links From the Guides
# ====================================

grep -i slides ~/<path to your class repo>/1-Lesson-Plans/$1/1/*uide.md | awk -F"(" '{print $2}' | awk -F")" '{print $1}' > ~/<path to your class repo>/1-Lesson-Plans/$1/1/Slides_Day_1
grep -i slides ~/<path to your class repo>/1-Lesson-Plans/$1/2/*uide.md | awk -F"(" '{print $2}' | awk -F")" '{print $1}' > ~/<path to your class repo>/1-Lesson-Plans/$1/2/Slides_Day_2
grep -i slides ~/<path to your class repo>/1-Lesson-Plans/$1/3/*uide.md | awk -F"(" '{print $2}' | awk -F")" '{print $1}' > ~/<path to your class repo>/1-Lesson-Plans/$1/3/Slides_Day_3

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

# =====================
# Add Unsolved Homework
# =====================

mkdir ~/<path to your class repo>/2-Homework

HOMEWORKSRC=~/<path to the instructional staff github repo>/2-Homework/$1
HOMEWORKDEST=~/<path to your class repo>/2-Homework
HOMEGIT=~/<path to your class repo>/*
HOMEWORKGIT=~/<path to your class repo>/2-Homework/*
HOMESOLVE=~/<path to your class repo>/2-Homework/$1

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

# =====================
# Add Solved Activities
# =====================

SOLVEDSRC=~/<path to the instructional staff github repo>/1-Lesson-Plans/$1
SOLVEDDEST=~/<path to your class repo>/1-Lesson-Plans
NEWSOLVEDDEST=~/<path to your class repo>/1-Lesson-Plans/$1

if [ $4 = "1" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWSOLVEDDEST/2 -iname sol* -exec rm -rf {} \;
  find $NEWSOLVEDDEST/3 -iname sol* -exec rm -rf {} \;
elif [ $4 = "2" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
  find $NEWSOLVEDDEST/3 -iname sol* -exec rm -rf {} \;
elif [ $4 = "3" ]; then
  for dir in $SOLVEDSRC; do
    cp -ru $SOLVEDSRC $SOLVEDDEST
  done
  find $NEWSOLVEDDEST -iname *lan.md -exec rm -rf {} \;
fi

find $NEWSOLVEDDEST -iname *assets* -exec rm -rf {} \;

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
fi

git add $2 && git commit -m "$3" && git push
