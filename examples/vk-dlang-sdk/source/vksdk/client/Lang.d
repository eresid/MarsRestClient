module vksdk.client.Lang;

/**
 * Supported languages
 */
class Lang {
	enum LangEnum {
		RU = "ru",
		UA = "ua",
		BE = "be",
		EN = "en",
		ES = "es",
		FI = "fi",
		DE = "de",
		IT = "it"
	}
	
	private immutable string value;

    this(string value) {
        this.value = value;
    }

    string getValue() {
        return value;
    }
}
