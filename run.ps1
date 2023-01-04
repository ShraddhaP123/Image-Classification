$name = Read-Host "Choose the classification algorithm: `nN:naiveBayes, `nP:Perceptron, `nK:KNearestNeighbors, `nA:All`n`n"
$iterations = Read-Host "Choose epochs/iterations:"

#Append values to the face and digit arrays to see how the
#algorithms perform with larger percentages of training data.
#Only using 10% of each data set to make it quick.
#You can also choose how many iterations of each to run.
#Note: The values for 10%-100% of training data for Faces are as follows:
#45(for 10%),90(for 20% etc.),135,180,225,270,315,360,405,451
#For digits:
#500,1000,1500,2000,2500,3000,3500,4000,4500,5000
$faceArray = 45,90,135,180,225,270,315,360,405,451
$digitArray = 500,1000,1500,2000,2500,3000,3500,4000,4500,5000

$total_face = 450
$total_digit = 5000
# Used to globally track how much time has passed
$start_time = Get-Date
#python dataClassifier.py -h
"epoch = " + $iterations
#-----------------------------------------------------NAIVE BAYES-----------------------------------------------------------
    if($name -eq 'N' -or $name -eq 'A')
    {
        "foo" >> resultsN.txt
        rm resultsN.txt
       "************************************************"
            "Running Classification"
            "Data: Faces"
            "Legal Labels: [0, 1]"
            "Classifier: Naive Bayes"
        "************************************************"
        "************************************************" >> resultsN.txt
            "Running Classification" >> resultsN.txt
            "Data: Faces" >> resultsN.txt
            "Legal Labels: [0, 1]" >> resultsN.txt
            "Classifier: Naive Bayes" >> resultsN.txt
        "************************************************" >> resultsN.txt
        foreach ($amount in $faceArray)
        {
            "-------------------------------------------------" >> resultsN.txt
            "Training data percent: " + ($amount/$total_face) * 100 + "%" >> resultsN.txt
            "Training data size: " + $amount >> resultsN.txt
            "-------------------------------------------------" >> resultsN.txt
            "Training data percent: " + ($amount/$total_face) * 100
            "Training data size: " + $amount
            $start_faces = Get-Date
            For ($i=0; $i -lt $iterations; $i++)
            {
                python dataClassifier.py -c naiveBayes -d faces -t $amount -s 150 >> resultsN.txt
            }
            $end_faces = Get-Date
            Write-host (New-TimeSpan -Start $start_faces -End $end_faces).TotalSeconds "seconds"
        }

        "************************************************" >> resultsN.txt
            "Running Classification" >> resultsN.txt
            "Data: Digits" >> resultsN.txt
            "Legal Labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]" >> resultsN.txt
            "Classifier: Naive Bayes" >> resultsN.txt
        "************************************************" >> resultsN.txt
        "************************************************"
            "Running Classification"
            "Data: Digits"
            "Legal Labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]"
            "Classifier: Naive Bayes"
        "************************************************"
        foreach ($amount in $digitArray)
        {
            "-------------------------------------------------" >> resultsN.txt
            "Training data percent: " + ($amount/$total_digit) * 100 + "%" >> resultsN.txt
            "Training data size: " + $amount >> resultsN.txt
            "-------------------------------------------------" >> resultsN.txt
            "Training data percent: " + ($amount/$total_digit) * 100
            "Training data size: " + $amount
            $start_digits = Get-Date
            For ($i=0; $i -lt $iterations; $i++)
            {
                python dataClassifier.py -c naiveBayes -d digits -t $amount -s 1000 -k .001 >> resultsN.txt
            }
            $end_digits = Get-Date
            Write-host (New-TimeSpan -Start $start_digits -End $end_digits).TotalSeconds "seconds"
        }

    }
    #-----------------------------------------------------PERCEPTRON-----------------------------------------------------------
    if($name -eq 'P' -or $name -eq 'A')
    {
        "foo" >> resultsP.txt
        rm resultsP.txt
        "************************************************"
            "Running Classification"
            "Data: Faces"
            "Legal Labels: [0, 1]"
            "Classifier: Perceptron"
        "************************************************"
        "************************************************" >> resultsP.txt
            "Running Classification" >> resultsP.txt
            "Data: Faces" >> resultsP.txt
            "Legal Labels: [0, 1]" >> resultsP.txt
            "Classifier: Perceptron" >> resultsP.txt
        "************************************************" >> resultsP.txt
        foreach ($amount in $faceArray)
        {
            "-------------------------------------------------" >> resultsP.txt
            "Training data percent: " + ($amount/$total_face) * 100 + "%" >> resultsP.txt
            "Training data size: " + $amount >> resultsP.txt
            "-------------------------------------------------" >> resultsP.txt
            "Training data percent: " + ($amount/$total_face) * 100
            "Training data size: " + $amount
            $start_faces = Get-Date
            For ($i=0; $i -lt $iterations; $i++)
            {
                python dataClassifier.py -c perceptron -d faces -t $amount -i 2 -s 150 >> resultsP.txt
            }
            $end_faces = Get-Date
            Write-host (New-TimeSpan -Start $start_faces -End $end_faces).TotalSeconds "seconds"
        }

        "************************************************"
            "Running Classification"
            "Data: Digits"
            "Legal Labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]"
            "Classifier: Perceptron"
        "************************************************"
        "************************************************" >> resultsP.txt
            "Running Classification" >> resultsP.txt
            "Data: Digits" >> resultsP.txt
            "Legal Labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]" >> resultsP.txt
            "Classifier: Perceptron" >> resultsP.txt
        "************************************************" >> resultsP.txt
        foreach ($amount in $digitArray)
        {
            "-------------------------------------------------" >> resultsP.txt
            "Training data percent: " + ($amount/$total_digit) * 100 + "%" >> resultsP.txt
            "Training data size: " + $amount >> resultsP.txt
            "-------------------------------------------------" >> resultsP.txt
            "Training data percent: " + ($amount/$total_digit) * 100
            "Training data size: " + $amount
            $start_digits = Get-Date
            For ($i=0; $i -lt $iterations; $i++)
            {
                python dataClassifier.py -c perceptron -d digits -t $amount -i 3 -s 1000 >> resultsP.txt
            }
            $end_digits = Get-Date
            Write-host (New-TimeSpan -Start $start_digits -End $end_digits).TotalSeconds "seconds"
        }

    }
    #-------------------------------------------------k NEAREST NEIGHBOR--------------------------------------------------------
    if($name -eq 'K' -or $name -eq 'A')
    {
        "foo" >> resultsK.txt
        rm resultsK.txt
        "************************************************" >> resultsK.txt
            "Running Classification" >> resultsK.txt
            "Data: Faces" >> resultsK.txt
            "Legal Labels: [0, 1]" >> resultsK.txt
            "Classifier: k Nearest Neighbor" >> resultsK.txt
        "************************************************" >> resultsK.txt
        "************************************************"
            "Running Classification"
            "Data: Faces"
            "Legal Labels: [0, 1]"
            "Classifier: k Nearest Neighbor"
        "************************************************"
        foreach ($amount in $faceArray)
        {
            "-------------------------------------------------" >> resultsK.txt
            "Training data percent: " + ($amount/$total_face) * 100 + "%" >> resultsK.txt
            "Training data size: " + $amount >> resultsK.txt
            "-------------------------------------------------" >> resultsK.txt
            "Training data percent: " + ($amount/$total_face) * 100
            "Training data size: " + $amount
            $start_faces = Get-Date
            For ($i=0; $i -lt $iterations; $i++)
            {
                python dataClassifier.py -c kNN -d faces -t $amount -s 150 >> resultsK.txt
            }
            $end_faces = Get-Date
            Write-host (New-TimeSpan -Start $start_faces -End $end_faces).TotalSeconds "seconds"
        }

        "************************************************" >> resultsK.txt
            "Running Classification" >> resultsK.txt
            "Data: Digits" >> resultsK.txt
            "Legal Labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]" >> resultsK.txt
            "Classifier: k Nearest Neighbor" >> resultsK.txt
        "************************************************" >> resultsK.txt
        "************************************************"
            "Running Classification"
            "Data: Digits"
            "Legal Labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]"
            "Classifier: k Nearest Neighbor"
        "************************************************"
        foreach ($amount in $digitArray)
        {
            "-------------------------------------------------" >> resultsK.txt
            "Training data percent: " + ($amount/$total_digit) * 100 + "%" >> resultsK.txt
            "Training data size: " + $amount >> resultsK.txt
            "-------------------------------------------------" >> resultsK.txt
            "Training data percent: " + ($amount/$total_digit) * 100
            "Training data size: " + $amount
            $start_digits = Get-Date
            For ($i=0; $i -lt $iterations; $i++)
            {
                python dataClassifier.py -c kNN -d digits -t $amount -s 1000 >> resultsK.txt
            }
            $end_digits = Get-Date
            Write-host (New-TimeSpan -Start $start_digits -End $end_digits).TotalSeconds "seconds"
        }

    }

$end_time = Get-Date
Write-host (New-TimeSpan -Start $start_time -End $end_time).TotalSeconds "seconds (TOTAL)"

python dataCalculations.py resultsN.txt
python dataCalculations.py resultsP.txt
python dataCalculations.py resultsK.txt
