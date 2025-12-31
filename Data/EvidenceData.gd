class_name EvidenceData

#All the evidence data is stored in this script
#We can load all evidence in here and refer to it in this dictionary.
#This makes checking evidence against testimony much easier.
#The same goes with evidence and profile prompts

const Data : Dictionary[Enums.Evidence, Dictionary] = {
	Enums.Evidence.Package: {
		"name" : "Package",
		"resource" : "uid://wq6550fc4ev4"
	},
	Enums.Evidence.Tape: {
		"name" : "Tape",
		"resource" : ""
	},
}
