extends Node

var _evinceItems : Dictionary[Enums.Evidence, EvidenceItem] = {}


func loadData() -> void:
	for key in EvidenceData.Data.keys():
		var data = EvidenceData.Data[key]
		var evidenceItem := EvidenceItem.new()
		evidenceItem.icon = load(data["icon"])
		evidenceItem.title = data["title"]
		evidenceItem.description = data["description"]
		_evinceItems[key] = evidenceItem

func getItem(id: Enums.Evidence) -> EvidenceItem:
	return _evinceItems.get(id)
