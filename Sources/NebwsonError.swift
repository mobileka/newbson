enum NewbsonError: Error, Equatable {
    case fileNotFound(path: String)
}

func ==(lhs: NewbsonError, rhs: NewbsonError) -> Bool {
	switch (lhs, rhs) {
    	case (.fileNotFound(let leftPath), .fileNotFound(let rightPath)):
      		return leftPath == rightPath
  	}
}
