package i18n

// Locale is the active language. "zh" = Chinese, "" or "en" = English.
var Locale string

// IsZH returns true when Chinese locale is active.
func IsZH() bool {
	return Locale == "zh"
}

// T returns the Chinese translation if locale is zh, otherwise the English fallback.
func T(en, zh string) string {
	if IsZH() {
		return zh
	}
	return en
}
