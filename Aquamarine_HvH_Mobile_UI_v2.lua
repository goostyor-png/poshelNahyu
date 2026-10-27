local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

local APP_NAME = "AQUAMARINE"
local APP_EDITION = "CREATIVE INTERFACE LAB"
local APP_VERSION = "2.0.0"
local UI_NOTICE = "VISUAL PROTOTYPE  /  LOCAL UI ONLY"

local THEMES = {
    Aquamarine = {
        accent = Color3.fromRGB(73, 224, 205),
        accent2 = Color3.fromRGB(46, 165, 173),
        accent3 = Color3.fromRGB(137, 255, 226),
        background = Color3.fromRGB(5, 10, 17),
        window = Color3.fromRGB(11, 18, 28),
        panel = Color3.fromRGB(14, 24, 36),
        card = Color3.fromRGB(19, 31, 45),
        raised = Color3.fromRGB(25, 41, 57),
        border = Color3.fromRGB(42, 66, 80),
        text = Color3.fromRGB(238, 248, 250),
        muted = Color3.fromRGB(151, 174, 188),
        faint = Color3.fromRGB(97, 124, 141),
        good = Color3.fromRGB(101, 232, 174),
        warning = Color3.fromRGB(255, 196, 105),
        danger = Color3.fromRGB(255, 112, 137),
    },
    Violet = {
        accent = Color3.fromRGB(183, 132, 255),
        accent2 = Color3.fromRGB(121, 91, 223),
        accent3 = Color3.fromRGB(221, 187, 255),
        background = Color3.fromRGB(10, 7, 18),
        window = Color3.fromRGB(18, 13, 30),
        panel = Color3.fromRGB(25, 18, 40),
        card = Color3.fromRGB(33, 24, 51),
        raised = Color3.fromRGB(46, 32, 69),
        border = Color3.fromRGB(77, 59, 109),
        text = Color3.fromRGB(247, 241, 255),
        muted = Color3.fromRGB(186, 169, 211),
        faint = Color3.fromRGB(124, 108, 151),
        good = Color3.fromRGB(111, 232, 185),
        warning = Color3.fromRGB(255, 205, 115),
        danger = Color3.fromRGB(255, 123, 164),
    },
    Ember = {
        accent = Color3.fromRGB(255, 151, 94),
        accent2 = Color3.fromRGB(222, 93, 79),
        accent3 = Color3.fromRGB(255, 200, 124),
        background = Color3.fromRGB(16, 8, 9),
        window = Color3.fromRGB(27, 14, 16),
        panel = Color3.fromRGB(36, 18, 21),
        card = Color3.fromRGB(48, 24, 27),
        raised = Color3.fromRGB(63, 31, 34),
        border = Color3.fromRGB(99, 50, 52),
        text = Color3.fromRGB(255, 242, 235),
        muted = Color3.fromRGB(204, 165, 154),
        faint = Color3.fromRGB(144, 105, 98),
        good = Color3.fromRGB(128, 225, 161),
        warning = Color3.fromRGB(255, 202, 99),
        danger = Color3.fromRGB(255, 103, 120),
    },
    Rose = {
        accent = Color3.fromRGB(255, 126, 190),
        accent2 = Color3.fromRGB(221, 91, 163),
        accent3 = Color3.fromRGB(255, 188, 222),
        background = Color3.fromRGB(16, 7, 14),
        window = Color3.fromRGB(26, 12, 22),
        panel = Color3.fromRGB(36, 17, 31),
        card = Color3.fromRGB(47, 23, 40),
        raised = Color3.fromRGB(62, 30, 53),
        border = Color3.fromRGB(97, 48, 82),
        text = Color3.fromRGB(255, 242, 250),
        muted = Color3.fromRGB(205, 166, 190),
        faint = Color3.fromRGB(143, 104, 130),
        good = Color3.fromRGB(123, 231, 183),
        warning = Color3.fromRGB(255, 205, 116),
        danger = Color3.fromRGB(255, 105, 145),
    },
    Arctic = {
        accent = Color3.fromRGB(100, 194, 255),
        accent2 = Color3.fromRGB(72, 137, 226),
        accent3 = Color3.fromRGB(174, 224, 255),
        background = Color3.fromRGB(5, 11, 19),
        window = Color3.fromRGB(10, 19, 31),
        panel = Color3.fromRGB(14, 27, 42),
        card = Color3.fromRGB(19, 34, 52),
        raised = Color3.fromRGB(25, 45, 66),
        border = Color3.fromRGB(42, 72, 101),
        text = Color3.fromRGB(238, 249, 255),
        muted = Color3.fromRGB(155, 182, 205),
        faint = Color3.fromRGB(99, 130, 157),
        good = Color3.fromRGB(104, 233, 183),
        warning = Color3.fromRGB(255, 204, 108),
        danger = Color3.fromRGB(255, 112, 133),
    },
    Emerald = {
        accent = Color3.fromRGB(113, 238, 157),
        accent2 = Color3.fromRGB(49, 177, 123),
        accent3 = Color3.fromRGB(182, 255, 191),
        background = Color3.fromRGB(5, 14, 11),
        window = Color3.fromRGB(10, 23, 18),
        panel = Color3.fromRGB(14, 31, 23),
        card = Color3.fromRGB(19, 40, 29),
        raised = Color3.fromRGB(25, 52, 37),
        border = Color3.fromRGB(42, 81, 58),
        text = Color3.fromRGB(239, 255, 244),
        muted = Color3.fromRGB(153, 192, 168),
        faint = Color3.fromRGB(96, 139, 112),
        good = Color3.fromRGB(103, 238, 157),
        warning = Color3.fromRGB(255, 206, 107),
        danger = Color3.fromRGB(255, 114, 138),
    },
    Gold = {
        accent = Color3.fromRGB(255, 204, 100),
        accent2 = Color3.fromRGB(210, 151, 58),
        accent3 = Color3.fromRGB(255, 232, 159),
        background = Color3.fromRGB(15, 11, 5),
        window = Color3.fromRGB(25, 19, 9),
        panel = Color3.fromRGB(35, 27, 12),
        card = Color3.fromRGB(46, 36, 16),
        raised = Color3.fromRGB(60, 47, 20),
        border = Color3.fromRGB(91, 72, 32),
        text = Color3.fromRGB(255, 249, 232),
        muted = Color3.fromRGB(204, 187, 145),
        faint = Color3.fromRGB(143, 126, 84),
        good = Color3.fromRGB(128, 230, 154),
        warning = Color3.fromRGB(255, 211, 105),
        danger = Color3.fromRGB(255, 112, 129),
    },
    Mono = {
        accent = Color3.fromRGB(223, 232, 240),
        accent2 = Color3.fromRGB(153, 169, 183),
        accent3 = Color3.fromRGB(255, 255, 255),
        background = Color3.fromRGB(6, 8, 11),
        window = Color3.fromRGB(13, 15, 19),
        panel = Color3.fromRGB(19, 22, 27),
        card = Color3.fromRGB(26, 30, 36),
        raised = Color3.fromRGB(35, 40, 47),
        border = Color3.fromRGB(58, 66, 75),
        text = Color3.fromRGB(245, 248, 250),
        muted = Color3.fromRGB(169, 179, 190),
        faint = Color3.fromRGB(111, 123, 135),
        good = Color3.fromRGB(173, 224, 194),
        warning = Color3.fromRGB(238, 208, 145),
        danger = Color3.fromRGB(245, 151, 163),
    },
}

local BACKGROUND_STYLES = {
    { id = "Aurora", title = "Aurora", description = "Мягкие световые волны и свободные переливы" },
    { id = "Grid", title = "Gridline", description = "Тонкая техническая сетка с движущимися точками" },
    { id = "Orbit", title = "Orbit", description = "Орбитальные кольца вокруг светового ядра" },
    { id = "Midnight", title = "Midnight", description = "Чистый тёмный фон с малым количеством эффектов" },
    { id = "Prism", title = "Prism", description = "Цветные стеклянные пятна и яркие блики" },
    { id = "Monolith", title = "Monolith", description = "Строгий минимализм без визуального шума" },
}

local TABS = {
    { id = "combat", title = "Combat", shortTitle = "COMBAT", glyph = "◈", subtitle = "Панель визуальных переключателей и тестовых контролов" },
    { id = "aim", title = "Aim lab", shortTitle = "AIM LAB", glyph = "◎", subtitle = "Макет параметров прицеливания без воздействия на игру" },
    { id = "visuals", title = "Visuals", shortTitle = "VISUALS", glyph = "✦", subtitle = "Декоративные визуальные параметры и индикаторы интерфейса" },
    { id = "movement", title = "Movement", shortTitle = "MOVE", glyph = "↗", subtitle = "Визуальные значения движения и презентационные пресеты" },
    { id = "player", title = "Player", shortTitle = "PLAYER", glyph = "◉", subtitle = "Локальные значения и демонстрационные состояния" },
    { id = "world", title = "World", shortTitle = "WORLD", glyph = "◇", subtitle = "Превью оформления мира и световых эффектов интерфейса" },
    { id = "misc", title = "Misc", shortTitle = "MISC", glyph = "⌘", subtitle = "Дополнительные демонстрационные переключатели" },
    { id = "themes", title = "Style lab", shortTitle = "STYLE LAB", glyph = "✧", subtitle = "Настройка палитры, фона, анимаций и геометрии" },
    { id = "config", title = "Profiles", shortTitle = "PROFILES", glyph = "▤", subtitle = "Локальные профили внешнего вида и быстрый сброс" },
}

local FEATURES = {
    {
        id = "combat_001",
        tab = "combat",
        title = "Combat card",
        description = "HUD feedback: combat card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "PREVIEW",
    },

    {
        id = "combat_002",
        tab = "combat",
        title = "Hit marker style",
        description = "Notification design: hit marker style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 27,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Notification design",
        badge = "STYLE",
    },

    {
        id = "combat_003",
        tab = "combat",
        title = "Impact pulse",
        description = "Marker layout: impact pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Sharp",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "Marker layout",
        badge = "DEMO",
    },

    {
        id = "combat_004",
        tab = "combat",
        title = "Damage label",
        description = "Animation profile: damage label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "UI ONLY",
    },

    {
        id = "combat_005",
        tab = "combat",
        title = "Target frame",
        description = "Impact styling: target frame с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · impact styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Impact styling",
        badge = "VISUAL",
    },

    {
        id = "combat_006",
        tab = "combat",
        title = "Status badge",
        description = "HUD feedback: status badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 55,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "LOCAL",
    },

    {
        id = "combat_007",
        tab = "combat",
        title = "Action trail",
        description = "Marker layout: action trail с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "PREVIEW",
    },

    {
        id = "combat_008",
        tab = "combat",
        title = "Hit flash",
        description = "Panel details: hit flash с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · panel details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Pulse",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "Panel details",
        badge = "STYLE",
    },

    {
        id = "combat_009",
        tab = "combat",
        title = "Event timeline",
        description = "Animation profile: event timeline с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "DEMO",
    },

    {
        id = "combat_010",
        tab = "combat",
        title = "Round indicator",
        description = "HUD feedback: round indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 83,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "UI ONLY",
    },

    {
        id = "combat_011",
        tab = "combat",
        title = "Threat card",
        description = "Notification design: threat card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Notification design",
        badge = "VISUAL",
    },

    {
        id = "combat_012",
        tab = "combat",
        title = "Focus panel",
        description = "Marker layout: focus panel с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "LOCAL",
    },

    {
        id = "combat_013",
        tab = "combat",
        title = "Hit spark",
        description = "Animation profile: hit spark с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "PREVIEW",
    },

    {
        id = "combat_014",
        tab = "combat",
        title = "Overlay outline",
        description = "Impact styling: overlay outline с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · impact styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 10,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Impact styling",
        badge = "STYLE",
    },

    {
        id = "combat_015",
        tab = "combat",
        title = "Combat meter",
        description = "HUD feedback: combat meter с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Sharp",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "HUD feedback",
        badge = "DEMO",
    },

    {
        id = "combat_016",
        tab = "combat",
        title = "Event glow",
        description = "Marker layout: event glow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "UI ONLY",
    },

    {
        id = "combat_017",
        tab = "combat",
        title = "Damage pulse",
        description = "Panel details: damage pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · panel details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 31,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Panel details",
        badge = "VISUAL",
    },

    {
        id = "combat_018",
        tab = "combat",
        title = "Impact ring",
        description = "Animation profile: impact ring с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "LOCAL",
    },

    {
        id = "combat_019",
        tab = "combat",
        title = "Marker offset",
        description = "HUD feedback: marker offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Sharp",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "HUD feedback",
        badge = "PREVIEW",
    },

    {
        id = "combat_020",
        tab = "combat",
        title = "Panel contrast",
        description = "Notification design: panel contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Notification design",
        badge = "STYLE",
    },

    {
        id = "combat_021",
        tab = "combat",
        title = "Notification queue",
        description = "Marker layout: notification queue с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 59,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Marker layout",
        badge = "DEMO",
    },

    {
        id = "combat_022",
        tab = "combat",
        title = "Critical badge",
        description = "Animation profile: critical badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "UI ONLY",
    },

    {
        id = "combat_023",
        tab = "combat",
        title = "Feedback tone",
        description = "Impact styling: feedback tone с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · impact styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Impact styling",
        badge = "VISUAL",
    },

    {
        id = "combat_024",
        tab = "combat",
        title = "Motion curve",
        description = "HUD feedback: motion curve с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "LOCAL",
    },

    {
        id = "combat_025",
        tab = "combat",
        title = "Effect duration",
        description = "Marker layout: effect duration с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 87,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Marker layout",
        badge = "PREVIEW",
    },

    {
        id = "combat_026",
        tab = "combat",
        title = "Effect scale",
        description = "Panel details: effect scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · panel details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Balanced",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "Panel details",
        badge = "STYLE",
    },

    {
        id = "combat_027",
        tab = "combat",
        title = "Highlight mode",
        description = "Animation profile: highlight mode с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "DEMO",
    },

    {
        id = "combat_028",
        tab = "combat",
        title = "Panel opacity",
        description = "HUD feedback: panel opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "UI ONLY",
    },

    {
        id = "combat_029",
        tab = "combat",
        title = "Badge radius",
        description = "Notification design: badge radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 14,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Notification design",
        badge = "VISUAL",
    },

    {
        id = "combat_030",
        tab = "combat",
        title = "Trail length",
        description = "Marker layout: trail length с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "LOCAL",
    },

    {
        id = "combat_031",
        tab = "combat",
        title = "Card density",
        description = "Animation profile: card density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Sharp",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "Animation profile",
        badge = "PREVIEW",
    },

    {
        id = "combat_032",
        tab = "combat",
        title = "Indicator offset",
        description = "Impact styling: indicator offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · impact styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Impact styling",
        badge = "STYLE",
    },

    {
        id = "combat_033",
        tab = "combat",
        title = "Pulse frequency",
        description = "HUD feedback: pulse frequency с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 42,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "DEMO",
    },

    {
        id = "combat_034",
        tab = "combat",
        title = "Flash intensity",
        description = "Marker layout: flash intensity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "UI ONLY",
    },

    {
        id = "combat_035",
        tab = "combat",
        title = "Ring thickness",
        description = "Panel details: ring thickness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · panel details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Panel details",
        badge = "VISUAL",
    },

    {
        id = "combat_036",
        tab = "combat",
        title = "Spark size",
        description = "Animation profile: spark size с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 63,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Animation profile",
        badge = "LOCAL",
    },

    {
        id = "combat_037",
        tab = "combat",
        title = "Marker spacing",
        description = "HUD feedback: marker spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Soft",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "HUD feedback",
        badge = "PREVIEW",
    },

    {
        id = "combat_038",
        tab = "combat",
        title = "Timeline zoom",
        description = "Notification design: timeline zoom с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Notification design",
        badge = "STYLE",
    },

    {
        id = "combat_039",
        tab = "combat",
        title = "Event fade",
        description = "Marker layout: event fade с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "DEMO",
    },

    {
        id = "combat_040",
        tab = "combat",
        title = "Status layout",
        description = "Animation profile: status layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 91,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Animation profile",
        badge = "UI ONLY",
    },

    {
        id = "combat_041",
        tab = "combat",
        title = "Meter gradient",
        description = "Impact styling: meter gradient с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · impact styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Impact styling",
        badge = "VISUAL",
    },

    {
        id = "combat_042",
        tab = "combat",
        title = "Outline softness",
        description = "HUD feedback: outline softness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Balanced",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "HUD feedback",
        badge = "LOCAL",
    },

    {
        id = "combat_043",
        tab = "combat",
        title = "Action label",
        description = "Marker layout: action label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "PREVIEW",
    },

    {
        id = "combat_044",
        tab = "combat",
        title = "Impact tint",
        description = "Panel details: impact tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · panel details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 18,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Panel details",
        badge = "STYLE",
    },

    {
        id = "combat_045",
        tab = "combat",
        title = "Alert position",
        description = "Animation profile: alert position с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "DEMO",
    },

    {
        id = "combat_046",
        tab = "combat",
        title = "Feedback mode",
        description = "HUD feedback: feedback mode с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "UI ONLY",
    },

    {
        id = "combat_047",
        tab = "combat",
        title = "Pulse palette",
        description = "Notification design: pulse palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Notification design",
        badge = "VISUAL",
    },

    {
        id = "combat_048",
        tab = "combat",
        title = "Effect blend",
        description = "Marker layout: effect blend с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 46,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Marker layout",
        badge = "LOCAL",
    },

    {
        id = "combat_049",
        tab = "combat",
        title = "Card border",
        description = "Animation profile: card border с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Soft",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "Animation profile",
        badge = "PREVIEW",
    },

    {
        id = "combat_050",
        tab = "combat",
        title = "Accent mode",
        description = "Impact styling: accent mode с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · impact styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Impact styling",
        badge = "STYLE",
    },

    {
        id = "combat_051",
        tab = "combat",
        title = "Compact status",
        description = "HUD feedback: compact status с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 67,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "DEMO",
    },

    {
        id = "combat_052",
        tab = "combat",
        title = "Preview trigger",
        description = "Marker layout: preview trigger с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "UI ONLY",
    },

    {
        id = "combat_053",
        tab = "combat",
        title = "Demo response",
        description = "Panel details: demo response с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · panel details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Soft",
        minimum = 0, maximum = 1, step = 1,
        options = {"Soft", "Balanced", "Sharp", "Pulse"},
        group = "Panel details",
        badge = "VISUAL",
    },

    {
        id = "combat_054",
        tab = "combat",
        title = "Event preset",
        description = "Animation profile: event preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "LOCAL",
    },

    {
        id = "combat_055",
        tab = "combat",
        title = "Overlay layout",
        description = "HUD feedback: overlay layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · hud feedback · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 95,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "HUD feedback",
        badge = "PREVIEW",
    },

    {
        id = "combat_056",
        tab = "combat",
        title = "Combat profile",
        description = "Notification design: combat profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · notification design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Notification design",
        badge = "STYLE",
    },

    {
        id = "combat_057",
        tab = "combat",
        title = "Visual feedback",
        description = "Marker layout: visual feedback с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · marker layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Marker layout",
        badge = "DEMO",
    },

    {
        id = "combat_058",
        tab = "combat",
        title = "Combat card · Soft",
        description = "Animation profile: combat card · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · animation profile · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Animation profile",
        badge = "UI ONLY",
    },

    {
        id = "aim_001",
        tab = "aim",
        title = "Reticle shape",
        description = "Overlay details: reticle shape с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "VISUAL",
    },

    {
        id = "aim_002",
        tab = "aim",
        title = "Reticle scale",
        description = "Reticle design: reticle scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reticle design",
        badge = "LOCAL",
    },

    {
        id = "aim_003",
        tab = "aim",
        title = "Reticle gap",
        description = "Focus indicators: reticle gap с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 34,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "PREVIEW",
    },

    {
        id = "aim_004",
        tab = "aim",
        title = "Reticle stroke",
        description = "Target styling: reticle stroke с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "STYLE",
    },

    {
        id = "aim_005",
        tab = "aim",
        title = "Reticle pulse",
        description = "Motion tuning: reticle pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Circle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Motion tuning",
        badge = "DEMO",
    },

    {
        id = "aim_006",
        tab = "aim",
        title = "Center dot",
        description = "Overlay details: center dot с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "UI ONLY",
    },

    {
        id = "aim_007",
        tab = "aim",
        title = "Outer ring",
        description = "Focus indicators: outer ring с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 62,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "VISUAL",
    },

    {
        id = "aim_008",
        tab = "aim",
        title = "Dynamic lines",
        description = "Preview options: dynamic lines с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview options · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview options",
        badge = "LOCAL",
    },

    {
        id = "aim_009",
        tab = "aim",
        title = "Focus indicator",
        description = "Target styling: focus indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "PREVIEW",
    },

    {
        id = "aim_010",
        tab = "aim",
        title = "Target card",
        description = "Overlay details: target card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 83,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Overlay details",
        badge = "STYLE",
    },

    {
        id = "aim_011",
        tab = "aim",
        title = "Tracking trail",
        description = "Reticle design: tracking trail с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Dot",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Reticle design",
        badge = "DEMO",
    },

    {
        id = "aim_012",
        tab = "aim",
        title = "Field overlay",
        description = "Focus indicators: field overlay с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "UI ONLY",
    },

    {
        id = "aim_013",
        tab = "aim",
        title = "Spread preview",
        description = "Target styling: spread preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "VISUAL",
    },

    {
        id = "aim_014",
        tab = "aim",
        title = "Precision badge",
        description = "Motion tuning: precision badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 10,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion tuning",
        badge = "LOCAL",
    },

    {
        id = "aim_015",
        tab = "aim",
        title = "Focus curve",
        description = "Overlay details: focus curve с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "PREVIEW",
    },

    {
        id = "aim_016",
        tab = "aim",
        title = "Motion smoothing",
        description = "Focus indicators: motion smoothing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Dynamic",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Focus indicators",
        badge = "STYLE",
    },

    {
        id = "aim_017",
        tab = "aim",
        title = "Line thickness",
        description = "Preview options: line thickness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview options · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview options",
        badge = "DEMO",
    },

    {
        id = "aim_018",
        tab = "aim",
        title = "Reticle rotation",
        description = "Target styling: reticle rotation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 38,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Target styling",
        badge = "UI ONLY",
    },

    {
        id = "aim_019",
        tab = "aim",
        title = "Center offset",
        description = "Overlay details: center offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "VISUAL",
    },

    {
        id = "aim_020",
        tab = "aim",
        title = "Ring opacity",
        description = "Reticle design: ring opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reticle design",
        badge = "LOCAL",
    },

    {
        id = "aim_021",
        tab = "aim",
        title = "Tracking color",
        description = "Focus indicators: tracking color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "PREVIEW",
    },

    {
        id = "aim_022",
        tab = "aim",
        title = "Preview speed",
        description = "Target styling: preview speed с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 66,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Target styling",
        badge = "STYLE",
    },

    {
        id = "aim_023",
        tab = "aim",
        title = "Focus pulse",
        description = "Motion tuning: focus pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Dot",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Motion tuning",
        badge = "DEMO",
    },

    {
        id = "aim_024",
        tab = "aim",
        title = "Marker scale",
        description = "Overlay details: marker scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "UI ONLY",
    },

    {
        id = "aim_025",
        tab = "aim",
        title = "Reticle bloom",
        description = "Focus indicators: reticle bloom с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "VISUAL",
    },

    {
        id = "aim_026",
        tab = "aim",
        title = "Aim label",
        description = "Preview options: aim label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview options · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 94,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview options",
        badge = "LOCAL",
    },

    {
        id = "aim_027",
        tab = "aim",
        title = "Target bracket",
        description = "Target styling: target bracket с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Dot",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Target styling",
        badge = "PREVIEW",
    },

    {
        id = "aim_028",
        tab = "aim",
        title = "Range marker",
        description = "Overlay details: range marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "STYLE",
    },

    {
        id = "aim_029",
        tab = "aim",
        title = "Scope tint",
        description = "Reticle design: scope tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 14,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Reticle design",
        badge = "DEMO",
    },

    {
        id = "aim_030",
        tab = "aim",
        title = "Zoom badge",
        description = "Focus indicators: zoom badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "UI ONLY",
    },

    {
        id = "aim_031",
        tab = "aim",
        title = "Crosshair preset",
        description = "Target styling: crosshair preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "VISUAL",
    },

    {
        id = "aim_032",
        tab = "aim",
        title = "Center shape",
        description = "Motion tuning: center shape с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion tuning",
        badge = "LOCAL",
    },

    {
        id = "aim_033",
        tab = "aim",
        title = "Line length",
        description = "Overlay details: line length с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 42,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Overlay details",
        badge = "PREVIEW",
    },

    {
        id = "aim_034",
        tab = "aim",
        title = "Outer gap",
        description = "Focus indicators: outer gap с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Cross",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Focus indicators",
        badge = "STYLE",
    },

    {
        id = "aim_035",
        tab = "aim",
        title = "Dot opacity",
        description = "Preview options: dot opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview options · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview options",
        badge = "DEMO",
    },

    {
        id = "aim_036",
        tab = "aim",
        title = "Tracking width",
        description = "Target styling: tracking width с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "UI ONLY",
    },

    {
        id = "aim_037",
        tab = "aim",
        title = "Focus radius",
        description = "Overlay details: focus radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 70,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Overlay details",
        badge = "VISUAL",
    },

    {
        id = "aim_038",
        tab = "aim",
        title = "Ring segments",
        description = "Reticle design: ring segments с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reticle design",
        badge = "LOCAL",
    },

    {
        id = "aim_039",
        tab = "aim",
        title = "Dynamic offset",
        description = "Focus indicators: dynamic offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Dot",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Focus indicators",
        badge = "PREVIEW",
    },

    {
        id = "aim_040",
        tab = "aim",
        title = "Preview easing",
        description = "Target styling: preview easing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "STYLE",
    },

    {
        id = "aim_041",
        tab = "aim",
        title = "Lock badge",
        description = "Motion tuning: lock badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 98,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion tuning",
        badge = "DEMO",
    },

    {
        id = "aim_042",
        tab = "aim",
        title = "Marker animation",
        description = "Overlay details: marker animation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "UI ONLY",
    },

    {
        id = "aim_043",
        tab = "aim",
        title = "Reticle glow",
        description = "Focus indicators: reticle glow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "VISUAL",
    },

    {
        id = "aim_044",
        tab = "aim",
        title = "Focus accent",
        description = "Preview options: focus accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview options · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 18,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview options",
        badge = "LOCAL",
    },

    {
        id = "aim_045",
        tab = "aim",
        title = "Scope border",
        description = "Target styling: scope border с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Circle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Target styling",
        badge = "PREVIEW",
    },

    {
        id = "aim_046",
        tab = "aim",
        title = "Target frame",
        description = "Overlay details: target frame с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "STYLE",
    },

    {
        id = "aim_047",
        tab = "aim",
        title = "Line pattern",
        description = "Reticle design: line pattern с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reticle design",
        badge = "DEMO",
    },

    {
        id = "aim_048",
        tab = "aim",
        title = "Profile switch",
        description = "Focus indicators: profile switch с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 46,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "UI ONLY",
    },

    {
        id = "aim_049",
        tab = "aim",
        title = "Preset preview",
        description = "Target styling: preset preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "VISUAL",
    },

    {
        id = "aim_050",
        tab = "aim",
        title = "Overlay balance",
        description = "Motion tuning: overlay balance с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Cross",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Motion tuning",
        badge = "LOCAL",
    },

    {
        id = "aim_051",
        tab = "aim",
        title = "Motion curve",
        description = "Overlay details: motion curve с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "PREVIEW",
    },

    {
        id = "aim_052",
        tab = "aim",
        title = "Focus label",
        description = "Focus indicators: focus label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 74,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Focus indicators",
        badge = "STYLE",
    },

    {
        id = "aim_053",
        tab = "aim",
        title = "Ring fill",
        description = "Preview options: ring fill с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview options · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview options",
        badge = "DEMO",
    },

    {
        id = "aim_054",
        tab = "aim",
        title = "Center highlight",
        description = "Target styling: center highlight с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "UI ONLY",
    },

    {
        id = "aim_055",
        tab = "aim",
        title = "Aim palette",
        description = "Overlay details: aim palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay details",
        badge = "VISUAL",
    },

    {
        id = "aim_056",
        tab = "aim",
        title = "Reticle profile",
        description = "Reticle design: reticle profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reticle design · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 1,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Reticle design",
        badge = "LOCAL",
    },

    {
        id = "aim_057",
        tab = "aim",
        title = "Tracking pattern",
        description = "Focus indicators: tracking pattern с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · focus indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Circle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Circle", "Cross", "Dot", "Dynamic"},
        group = "Focus indicators",
        badge = "PREVIEW",
    },

    {
        id = "aim_058",
        tab = "aim",
        title = "Preview grid",
        description = "Target styling: preview grid с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · target styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Target styling",
        badge = "STYLE",
    },

    {
        id = "visuals_001",
        tab = "visuals",
        title = "Entity card",
        description = "Color treatment: entity card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "DEMO",
    },

    {
        id = "visuals_002",
        tab = "visuals",
        title = "Outline mode",
        description = "Markers and trails: outline mode с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Outline",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Markers and trails",
        badge = "UI ONLY",
    },

    {
        id = "visuals_003",
        tab = "visuals",
        title = "Glow intensity",
        description = "Preview layout: glow intensity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 34,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview layout",
        badge = "VISUAL",
    },

    {
        id = "visuals_004",
        tab = "visuals",
        title = "Distance label",
        description = "Label system: distance label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Label system",
        badge = "LOCAL",
    },

    {
        id = "visuals_005",
        tab = "visuals",
        title = "Nameplate style",
        description = "Highlight effects: nameplate style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · highlight effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Highlight effects",
        badge = "PREVIEW",
    },

    {
        id = "visuals_006",
        tab = "visuals",
        title = "Health strip",
        description = "Color treatment: health strip с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "STYLE",
    },

    {
        id = "visuals_007",
        tab = "visuals",
        title = "Box corners",
        description = "Preview layout: box corners с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 62,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview layout",
        badge = "DEMO",
    },

    {
        id = "visuals_008",
        tab = "visuals",
        title = "Skeleton tint",
        description = "Overlay appearance: skeleton tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Glass",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Overlay appearance",
        badge = "UI ONLY",
    },

    {
        id = "visuals_009",
        tab = "visuals",
        title = "Trail material",
        description = "Label system: trail material с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Label system",
        badge = "VISUAL",
    },

    {
        id = "visuals_010",
        tab = "visuals",
        title = "Highlight pulse",
        description = "Color treatment: highlight pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "LOCAL",
    },

    {
        id = "visuals_011",
        tab = "visuals",
        title = "Visibility badge",
        description = "Markers and trails: visibility badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 90,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Markers and trails",
        badge = "PREVIEW",
    },

    {
        id = "visuals_012",
        tab = "visuals",
        title = "Text shadow",
        description = "Preview layout: text shadow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "STYLE",
    },

    {
        id = "visuals_013",
        tab = "visuals",
        title = "Fill opacity",
        description = "Label system: fill opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Clean",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Label system",
        badge = "DEMO",
    },

    {
        id = "visuals_014",
        tab = "visuals",
        title = "Edge softness",
        description = "Highlight effects: edge softness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · highlight effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Highlight effects",
        badge = "UI ONLY",
    },

    {
        id = "visuals_015",
        tab = "visuals",
        title = "Color profile",
        description = "Color treatment: color profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 17,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Color treatment",
        badge = "VISUAL",
    },

    {
        id = "visuals_016",
        tab = "visuals",
        title = "Marker icon",
        description = "Preview layout: marker icon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "LOCAL",
    },

    {
        id = "visuals_017",
        tab = "visuals",
        title = "Distance format",
        description = "Overlay appearance: distance format с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay appearance",
        badge = "PREVIEW",
    },

    {
        id = "visuals_018",
        tab = "visuals",
        title = "Label offset",
        description = "Label system: label offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Label system",
        badge = "STYLE",
    },

    {
        id = "visuals_019",
        tab = "visuals",
        title = "Box thickness",
        description = "Color treatment: box thickness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 45,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Color treatment",
        badge = "DEMO",
    },

    {
        id = "visuals_020",
        tab = "visuals",
        title = "Glow radius",
        description = "Markers and trails: glow radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Markers and trails",
        badge = "UI ONLY",
    },

    {
        id = "visuals_021",
        tab = "visuals",
        title = "Gradient direction",
        description = "Preview layout: gradient direction с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "VISUAL",
    },

    {
        id = "visuals_022",
        tab = "visuals",
        title = "ESP card",
        description = "Label system: esp card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 66,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Label system",
        badge = "LOCAL",
    },

    {
        id = "visuals_023",
        tab = "visuals",
        title = "Indicator stack",
        description = "Highlight effects: indicator stack с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · highlight effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Highlight effects",
        badge = "PREVIEW",
    },

    {
        id = "visuals_024",
        tab = "visuals",
        title = "Text contrast",
        description = "Color treatment: text contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Glass",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Color treatment",
        badge = "STYLE",
    },

    {
        id = "visuals_025",
        tab = "visuals",
        title = "Health color",
        description = "Preview layout: health color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "DEMO",
    },

    {
        id = "visuals_026",
        tab = "visuals",
        title = "Nameplate width",
        description = "Overlay appearance: nameplate width с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 94,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Overlay appearance",
        badge = "UI ONLY",
    },

    {
        id = "visuals_027",
        tab = "visuals",
        title = "Skeleton width",
        description = "Label system: skeleton width с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Label system",
        badge = "VISUAL",
    },

    {
        id = "visuals_028",
        tab = "visuals",
        title = "Trail opacity",
        description = "Color treatment: trail opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "LOCAL",
    },

    {
        id = "visuals_029",
        tab = "visuals",
        title = "Pulse speed",
        description = "Markers and trails: pulse speed с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Markers and trails",
        badge = "PREVIEW",
    },

    {
        id = "visuals_030",
        tab = "visuals",
        title = "Glow softness",
        description = "Preview layout: glow softness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 21,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview layout",
        badge = "STYLE",
    },

    {
        id = "visuals_031",
        tab = "visuals",
        title = "Edge contrast",
        description = "Label system: edge contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Glow",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Label system",
        badge = "DEMO",
    },

    {
        id = "visuals_032",
        tab = "visuals",
        title = "Marker scale",
        description = "Highlight effects: marker scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · highlight effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Highlight effects",
        badge = "UI ONLY",
    },

    {
        id = "visuals_033",
        tab = "visuals",
        title = "Outline tint",
        description = "Color treatment: outline tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "VISUAL",
    },

    {
        id = "visuals_034",
        tab = "visuals",
        title = "Card background",
        description = "Preview layout: card background с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 49,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview layout",
        badge = "LOCAL",
    },

    {
        id = "visuals_035",
        tab = "visuals",
        title = "Label background",
        description = "Overlay appearance: label background с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay appearance",
        badge = "PREVIEW",
    },

    {
        id = "visuals_036",
        tab = "visuals",
        title = "Distance suffix",
        description = "Label system: distance suffix с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Glass",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Label system",
        badge = "STYLE",
    },

    {
        id = "visuals_037",
        tab = "visuals",
        title = "Badge shape",
        description = "Color treatment: badge shape с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 70,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Color treatment",
        badge = "DEMO",
    },

    {
        id = "visuals_038",
        tab = "visuals",
        title = "Fill gradient",
        description = "Markers and trails: fill gradient с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Markers and trails",
        badge = "UI ONLY",
    },

    {
        id = "visuals_039",
        tab = "visuals",
        title = "Trail length",
        description = "Preview layout: trail length с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "VISUAL",
    },

    {
        id = "visuals_040",
        tab = "visuals",
        title = "Highlight mode",
        description = "Label system: highlight mode с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Label system",
        badge = "LOCAL",
    },

    {
        id = "visuals_041",
        tab = "visuals",
        title = "Overlay spacing",
        description = "Highlight effects: overlay spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · highlight effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 98,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Highlight effects",
        badge = "PREVIEW",
    },

    {
        id = "visuals_042",
        tab = "visuals",
        title = "Card padding",
        description = "Color treatment: card padding с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Outline",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Color treatment",
        badge = "STYLE",
    },

    {
        id = "visuals_043",
        tab = "visuals",
        title = "Text scale",
        description = "Preview layout: text scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "DEMO",
    },

    {
        id = "visuals_044",
        tab = "visuals",
        title = "Health format",
        description = "Overlay appearance: health format с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Overlay appearance",
        badge = "UI ONLY",
    },

    {
        id = "visuals_045",
        tab = "visuals",
        title = "Border style",
        description = "Label system: border style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 25,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Label system",
        badge = "VISUAL",
    },

    {
        id = "visuals_046",
        tab = "visuals",
        title = "Marker pulse",
        description = "Color treatment: marker pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "LOCAL",
    },

    {
        id = "visuals_047",
        tab = "visuals",
        title = "Info density",
        description = "Markers and trails: info density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Glow",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Markers and trails",
        badge = "PREVIEW",
    },

    {
        id = "visuals_048",
        tab = "visuals",
        title = "Label animation",
        description = "Preview layout: label animation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "STYLE",
    },

    {
        id = "visuals_049",
        tab = "visuals",
        title = "Preview target",
        description = "Label system: preview target с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 53,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Label system",
        badge = "DEMO",
    },

    {
        id = "visuals_050",
        tab = "visuals",
        title = "Color mapping",
        description = "Highlight effects: color mapping с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · highlight effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Highlight effects",
        badge = "UI ONLY",
    },

    {
        id = "visuals_051",
        tab = "visuals",
        title = "Distance clamp",
        description = "Color treatment: distance clamp с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "VISUAL",
    },

    {
        id = "visuals_052",
        tab = "visuals",
        title = "Visual preset",
        description = "Preview layout: visual preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "LOCAL",
    },

    {
        id = "visuals_053",
        tab = "visuals",
        title = "Visual filter",
        description = "Overlay appearance: visual filter с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · overlay appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 81,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Overlay appearance",
        badge = "PREVIEW",
    },

    {
        id = "visuals_054",
        tab = "visuals",
        title = "Overlay profile",
        description = "Label system: overlay profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Label system",
        badge = "STYLE",
    },

    {
        id = "visuals_055",
        tab = "visuals",
        title = "Highlight stack",
        description = "Color treatment: highlight stack с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color treatment",
        badge = "DEMO",
    },

    {
        id = "visuals_056",
        tab = "visuals",
        title = "Nameplate tint",
        description = "Markers and trails: nameplate tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · markers and trails · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 1,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Markers and trails",
        badge = "UI ONLY",
    },

    {
        id = "visuals_057",
        tab = "visuals",
        title = "Preview animation",
        description = "Preview layout: preview animation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview layout · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview layout",
        badge = "VISUAL",
    },

    {
        id = "visuals_058",
        tab = "visuals",
        title = "Entity card · Soft",
        description = "Label system: entity card · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · label system · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Outline",
        minimum = 0, maximum = 1, step = 1,
        options = {"Clean", "Outline", "Glow", "Glass"},
        group = "Label system",
        badge = "LOCAL",
    },

    {
        id = "movement_001",
        tab = "movement",
        title = "Motion card",
        description = "Movement HUD: motion card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "PREVIEW",
    },

    {
        id = "movement_002",
        tab = "movement",
        title = "Speed meter",
        description = "Trail appearance: speed meter с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "STYLE",
    },

    {
        id = "movement_003",
        tab = "movement",
        title = "Step indicator",
        description = "Camera presentation: step indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "DEMO",
    },

    {
        id = "movement_004",
        tab = "movement",
        title = "Landing pulse",
        description = "Route visuals: landing pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 41,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Route visuals",
        badge = "UI ONLY",
    },

    {
        id = "movement_005",
        tab = "movement",
        title = "Air trail",
        description = "Motion graphics: air trail с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Smooth",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Motion graphics",
        badge = "VISUAL",
    },

    {
        id = "movement_006",
        tab = "movement",
        title = "Route line",
        description = "Movement HUD: route line с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "LOCAL",
    },

    {
        id = "movement_007",
        tab = "movement",
        title = "Movement badge",
        description = "Camera presentation: movement badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "PREVIEW",
    },

    {
        id = "movement_008",
        tab = "movement",
        title = "Acceleration graph",
        description = "Graph styling: acceleration graph с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · graph styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 69,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Graph styling",
        badge = "STYLE",
    },

    {
        id = "movement_009",
        tab = "movement",
        title = "Motion blur preview",
        description = "Route visuals: motion blur preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "DEMO",
    },

    {
        id = "movement_010",
        tab = "movement",
        title = "Camera sway",
        description = "Movement HUD: camera sway с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Arc",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Movement HUD",
        badge = "UI ONLY",
    },

    {
        id = "movement_011",
        tab = "movement",
        title = "Dash marker",
        description = "Trail appearance: dash marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "VISUAL",
    },

    {
        id = "movement_012",
        tab = "movement",
        title = "Jump arc",
        description = "Camera presentation: jump arc с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 97,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "LOCAL",
    },

    {
        id = "movement_013",
        tab = "movement",
        title = "Footstep ring",
        description = "Route visuals: footstep ring с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "PREVIEW",
    },

    {
        id = "movement_014",
        tab = "movement",
        title = "Momentum label",
        description = "Motion graphics: momentum label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion graphics",
        badge = "STYLE",
    },

    {
        id = "movement_015",
        tab = "movement",
        title = "Slide effect",
        description = "Movement HUD: slide effect с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 17,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "DEMO",
    },

    {
        id = "movement_016",
        tab = "movement",
        title = "Run trail",
        description = "Camera presentation: run trail с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Minimal",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Camera presentation",
        badge = "UI ONLY",
    },

    {
        id = "movement_017",
        tab = "movement",
        title = "Turn indicator",
        description = "Graph styling: turn indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · graph styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Graph styling",
        badge = "VISUAL",
    },

    {
        id = "movement_018",
        tab = "movement",
        title = "Motion curve",
        description = "Route visuals: motion curve с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "LOCAL",
    },

    {
        id = "movement_019",
        tab = "movement",
        title = "Route opacity",
        description = "Movement HUD: route opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 45,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "PREVIEW",
    },

    {
        id = "movement_020",
        tab = "movement",
        title = "Air marker",
        description = "Trail appearance: air marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "STYLE",
    },

    {
        id = "movement_021",
        tab = "movement",
        title = "Landing tint",
        description = "Camera presentation: landing tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Smooth",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Camera presentation",
        badge = "DEMO",
    },

    {
        id = "movement_022",
        tab = "movement",
        title = "Speed label",
        description = "Route visuals: speed label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "UI ONLY",
    },

    {
        id = "movement_023",
        tab = "movement",
        title = "Trail spacing",
        description = "Motion graphics: trail spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 73,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion graphics",
        badge = "VISUAL",
    },

    {
        id = "movement_024",
        tab = "movement",
        title = "Camera damping",
        description = "Movement HUD: camera damping с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "LOCAL",
    },

    {
        id = "movement_025",
        tab = "movement",
        title = "Arc thickness",
        description = "Camera presentation: arc thickness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "PREVIEW",
    },

    {
        id = "movement_026",
        tab = "movement",
        title = "Motion scale",
        description = "Graph styling: motion scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · graph styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Graph styling",
        badge = "STYLE",
    },

    {
        id = "movement_027",
        tab = "movement",
        title = "Step flash",
        description = "Route visuals: step flash с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 0,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Route visuals",
        badge = "DEMO",
    },

    {
        id = "movement_028",
        tab = "movement",
        title = "Momentum bar",
        description = "Movement HUD: momentum bar с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Minimal",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Movement HUD",
        badge = "UI ONLY",
    },

    {
        id = "movement_029",
        tab = "movement",
        title = "Turn easing",
        description = "Trail appearance: turn easing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "VISUAL",
    },

    {
        id = "movement_030",
        tab = "movement",
        title = "Route points",
        description = "Camera presentation: route points с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 21,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "LOCAL",
    },

    {
        id = "movement_031",
        tab = "movement",
        title = "Trail color",
        description = "Route visuals: trail color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "PREVIEW",
    },

    {
        id = "movement_032",
        tab = "movement",
        title = "Camera offset",
        description = "Motion graphics: camera offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Minimal",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Motion graphics",
        badge = "STYLE",
    },

    {
        id = "movement_033",
        tab = "movement",
        title = "Arc segments",
        description = "Movement HUD: arc segments с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "DEMO",
    },

    {
        id = "movement_034",
        tab = "movement",
        title = "Dash glow",
        description = "Camera presentation: dash glow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 49,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "UI ONLY",
    },

    {
        id = "movement_035",
        tab = "movement",
        title = "Footstep pulse",
        description = "Graph styling: footstep pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · graph styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Graph styling",
        badge = "VISUAL",
    },

    {
        id = "movement_036",
        tab = "movement",
        title = "Graph range",
        description = "Route visuals: graph range с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "LOCAL",
    },

    {
        id = "movement_037",
        tab = "movement",
        title = "Meter gradient",
        description = "Movement HUD: meter gradient с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "PREVIEW",
    },

    {
        id = "movement_038",
        tab = "movement",
        title = "Slide tint",
        description = "Trail appearance: slide tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 77,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "STYLE",
    },

    {
        id = "movement_039",
        tab = "movement",
        title = "Run indicator",
        description = "Camera presentation: run indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Trail",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Camera presentation",
        badge = "DEMO",
    },

    {
        id = "movement_040",
        tab = "movement",
        title = "Motion preview",
        description = "Route visuals: motion preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "UI ONLY",
    },

    {
        id = "movement_041",
        tab = "movement",
        title = "Speed unit",
        description = "Motion graphics: speed unit с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion graphics",
        badge = "VISUAL",
    },

    {
        id = "movement_042",
        tab = "movement",
        title = "Movement preset",
        description = "Movement HUD: movement preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 4,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "LOCAL",
    },

    {
        id = "movement_043",
        tab = "movement",
        title = "Route style",
        description = "Camera presentation: route style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "PREVIEW",
    },

    {
        id = "movement_044",
        tab = "movement",
        title = "Camera profile",
        description = "Graph styling: camera profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · graph styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Minimal",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Graph styling",
        badge = "STYLE",
    },

    {
        id = "movement_045",
        tab = "movement",
        title = "Landing marker",
        description = "Route visuals: landing marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "DEMO",
    },

    {
        id = "movement_046",
        tab = "movement",
        title = "Step count",
        description = "Movement HUD: step count с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 32,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "UI ONLY",
    },

    {
        id = "movement_047",
        tab = "movement",
        title = "Air time label",
        description = "Trail appearance: air time label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "VISUAL",
    },

    {
        id = "movement_048",
        tab = "movement",
        title = "Momentum pulse",
        description = "Camera presentation: momentum pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "LOCAL",
    },

    {
        id = "movement_049",
        tab = "movement",
        title = "Turn marker",
        description = "Route visuals: turn marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 53,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Route visuals",
        badge = "PREVIEW",
    },

    {
        id = "movement_050",
        tab = "movement",
        title = "Motion density",
        description = "Motion graphics: motion density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Arc",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Motion graphics",
        badge = "STYLE",
    },

    {
        id = "movement_051",
        tab = "movement",
        title = "Preview pace",
        description = "Movement HUD: preview pace с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Movement HUD",
        badge = "DEMO",
    },

    {
        id = "movement_052",
        tab = "movement",
        title = "Trail softness",
        description = "Camera presentation: trail softness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "UI ONLY",
    },

    {
        id = "movement_053",
        tab = "movement",
        title = "Arc color",
        description = "Graph styling: arc color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · graph styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 81,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Graph styling",
        badge = "VISUAL",
    },

    {
        id = "movement_054",
        tab = "movement",
        title = "Route marker",
        description = "Route visuals: route marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "LOCAL",
    },

    {
        id = "movement_055",
        tab = "movement",
        title = "Motion panel",
        description = "Movement HUD: motion panel с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · movement hud · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Trail",
        minimum = 0, maximum = 1, step = 1,
        options = {"Smooth", "Arc", "Trail", "Minimal"},
        group = "Movement HUD",
        badge = "PREVIEW",
    },

    {
        id = "movement_056",
        tab = "movement",
        title = "Movement palette",
        description = "Trail appearance: movement palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · trail appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Trail appearance",
        badge = "STYLE",
    },

    {
        id = "movement_057",
        tab = "movement",
        title = "Step timing",
        description = "Camera presentation: step timing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · camera presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 8,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Camera presentation",
        badge = "DEMO",
    },

    {
        id = "movement_058",
        tab = "movement",
        title = "Motion card · Soft",
        description = "Route visuals: motion card · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · route visuals · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Route visuals",
        badge = "UI ONLY",
    },

    {
        id = "player_001",
        tab = "player",
        title = "Player card",
        description = "Player previews: player card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 20,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Player previews",
        badge = "VISUAL",
    },

    {
        id = "player_002",
        tab = "player",
        title = "Avatar frame",
        description = "Identity styling: avatar frame с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Card",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Identity styling",
        badge = "LOCAL",
    },

    {
        id = "player_003",
        tab = "player",
        title = "Profile badge",
        description = "Profile details: profile badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "PREVIEW",
    },

    {
        id = "player_004",
        tab = "player",
        title = "Status ring",
        description = "Status presentation: status ring с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Status presentation",
        badge = "STYLE",
    },

    {
        id = "player_005",
        tab = "player",
        title = "Name label",
        description = "Card geometry: name label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · card geometry · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 48,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Card geometry",
        badge = "DEMO",
    },

    {
        id = "player_006",
        tab = "player",
        title = "Session timer",
        description = "Player previews: session timer с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Card",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Player previews",
        badge = "UI ONLY",
    },

    {
        id = "player_007",
        tab = "player",
        title = "Role tag",
        description = "Profile details: role tag с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "VISUAL",
    },

    {
        id = "player_008",
        tab = "player",
        title = "Rank plate",
        description = "Progress indicators: rank plate с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · progress indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 69,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Progress indicators",
        badge = "LOCAL",
    },

    {
        id = "player_009",
        tab = "player",
        title = "Level progress",
        description = "Status presentation: level progress с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Status presentation",
        badge = "PREVIEW",
    },

    {
        id = "player_010",
        tab = "player",
        title = "Stat counter",
        description = "Player previews: stat counter с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "STYLE",
    },

    {
        id = "player_011",
        tab = "player",
        title = "Card portrait",
        description = "Identity styling: card portrait с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Identity styling",
        badge = "DEMO",
    },

    {
        id = "player_012",
        tab = "player",
        title = "Status color",
        description = "Profile details: status color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 97,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Profile details",
        badge = "UI ONLY",
    },

    {
        id = "player_013",
        tab = "player",
        title = "Avatar outline",
        description = "Status presentation: avatar outline с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Compact",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Status presentation",
        badge = "VISUAL",
    },

    {
        id = "player_014",
        tab = "player",
        title = "Badge stack",
        description = "Card geometry: badge stack с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · card geometry · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Card geometry",
        badge = "LOCAL",
    },

    {
        id = "player_015",
        tab = "player",
        title = "Player footer",
        description = "Player previews: player footer с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "PREVIEW",
    },

    {
        id = "player_016",
        tab = "player",
        title = "Info layout",
        description = "Profile details: info layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 24,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Profile details",
        badge = "STYLE",
    },

    {
        id = "player_017",
        tab = "player",
        title = "Level accent",
        description = "Progress indicators: level accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · progress indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Progress indicators",
        badge = "DEMO",
    },

    {
        id = "player_018",
        tab = "player",
        title = "Profile border",
        description = "Status presentation: profile border с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Card",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Status presentation",
        badge = "UI ONLY",
    },

    {
        id = "player_019",
        tab = "player",
        title = "Counter style",
        description = "Player previews: counter style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "VISUAL",
    },

    {
        id = "player_020",
        tab = "player",
        title = "Status pulse",
        description = "Identity styling: status pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 52,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Identity styling",
        badge = "LOCAL",
    },

    {
        id = "player_021",
        tab = "player",
        title = "Nameplate scale",
        description = "Profile details: nameplate scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "PREVIEW",
    },

    {
        id = "player_022",
        tab = "player",
        title = "Card shadow",
        description = "Status presentation: card shadow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Status presentation",
        badge = "STYLE",
    },

    {
        id = "player_023",
        tab = "player",
        title = "Rank icon",
        description = "Card geometry: rank icon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · card geometry · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 73,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Card geometry",
        badge = "DEMO",
    },

    {
        id = "player_024",
        tab = "player",
        title = "Progress fill",
        description = "Player previews: progress fill с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Panel",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Player previews",
        badge = "UI ONLY",
    },

    {
        id = "player_025",
        tab = "player",
        title = "Session format",
        description = "Profile details: session format с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "VISUAL",
    },

    {
        id = "player_026",
        tab = "player",
        title = "Role color",
        description = "Progress indicators: role color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · progress indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Progress indicators",
        badge = "LOCAL",
    },

    {
        id = "player_027",
        tab = "player",
        title = "Stat spacing",
        description = "Status presentation: stat spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 0,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Status presentation",
        badge = "PREVIEW",
    },

    {
        id = "player_028",
        tab = "player",
        title = "Portrait tint",
        description = "Player previews: portrait tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "STYLE",
    },

    {
        id = "player_029",
        tab = "player",
        title = "Avatar radius",
        description = "Identity styling: avatar radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Compact",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Identity styling",
        badge = "DEMO",
    },

    {
        id = "player_030",
        tab = "player",
        title = "Badge shape",
        description = "Profile details: badge shape с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "UI ONLY",
    },

    {
        id = "player_031",
        tab = "player",
        title = "Progress label",
        description = "Status presentation: progress label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 28,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Status presentation",
        badge = "VISUAL",
    },

    {
        id = "player_032",
        tab = "player",
        title = "Counter motion",
        description = "Card geometry: counter motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · card geometry · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Card geometry",
        badge = "LOCAL",
    },

    {
        id = "player_033",
        tab = "player",
        title = "Status icon",
        description = "Player previews: status icon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "PREVIEW",
    },

    {
        id = "player_034",
        tab = "player",
        title = "Footer alignment",
        description = "Profile details: footer alignment с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "STYLE",
    },

    {
        id = "player_035",
        tab = "player",
        title = "Profile glow",
        description = "Progress indicators: profile glow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · progress indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 56,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Progress indicators",
        badge = "DEMO",
    },

    {
        id = "player_036",
        tab = "player",
        title = "Level gradient",
        description = "Status presentation: level gradient с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Panel",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Status presentation",
        badge = "UI ONLY",
    },

    {
        id = "player_037",
        tab = "player",
        title = "Name truncation",
        description = "Player previews: name truncation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "VISUAL",
    },

    {
        id = "player_038",
        tab = "player",
        title = "Card density",
        description = "Identity styling: card density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Identity styling",
        badge = "LOCAL",
    },

    {
        id = "player_039",
        tab = "player",
        title = "Rank palette",
        description = "Profile details: rank palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 84,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Profile details",
        badge = "PREVIEW",
    },

    {
        id = "player_040",
        tab = "player",
        title = "Progress height",
        description = "Status presentation: progress height с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Panel",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Status presentation",
        badge = "STYLE",
    },

    {
        id = "player_041",
        tab = "player",
        title = "Status layout",
        description = "Card geometry: status layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · card geometry · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Card geometry",
        badge = "DEMO",
    },

    {
        id = "player_042",
        tab = "player",
        title = "Portrait offset",
        description = "Player previews: portrait offset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 4,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Player previews",
        badge = "UI ONLY",
    },

    {
        id = "player_043",
        tab = "player",
        title = "Badge padding",
        description = "Profile details: badge padding с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "VISUAL",
    },

    {
        id = "player_044",
        tab = "player",
        title = "Stat format",
        description = "Progress indicators: stat format с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · progress indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Progress indicators",
        badge = "LOCAL",
    },

    {
        id = "player_045",
        tab = "player",
        title = "Player preset",
        description = "Status presentation: player preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Status presentation",
        badge = "PREVIEW",
    },

    {
        id = "player_046",
        tab = "player",
        title = "Profile preview",
        description = "Player previews: profile preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 32,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Player previews",
        badge = "STYLE",
    },

    {
        id = "player_047",
        tab = "player",
        title = "Session badge",
        description = "Identity styling: session badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Badge",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Identity styling",
        badge = "DEMO",
    },

    {
        id = "player_048",
        tab = "player",
        title = "Info hierarchy",
        description = "Profile details: info hierarchy с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile details",
        badge = "UI ONLY",
    },

    {
        id = "player_049",
        tab = "player",
        title = "Card outline",
        description = "Status presentation: card outline с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Status presentation",
        badge = "VISUAL",
    },

    {
        id = "player_050",
        tab = "player",
        title = "Role indicator",
        description = "Card geometry: role indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · card geometry · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 60,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Card geometry",
        badge = "LOCAL",
    },

    {
        id = "player_051",
        tab = "player",
        title = "Counter scale",
        description = "Player previews: counter scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "PREVIEW",
    },

    {
        id = "player_052",
        tab = "player",
        title = "Status effect",
        description = "Profile details: status effect с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Panel",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Profile details",
        badge = "STYLE",
    },

    {
        id = "player_053",
        tab = "player",
        title = "Avatar mask",
        description = "Progress indicators: avatar mask с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · progress indicators · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Progress indicators",
        badge = "DEMO",
    },

    {
        id = "player_054",
        tab = "player",
        title = "Label contrast",
        description = "Status presentation: label contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 88,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Status presentation",
        badge = "UI ONLY",
    },

    {
        id = "player_055",
        tab = "player",
        title = "Panel accent",
        description = "Player previews: panel accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · player previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Player previews",
        badge = "VISUAL",
    },

    {
        id = "player_056",
        tab = "player",
        title = "Player palette",
        description = "Identity styling: player palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · identity styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Identity styling",
        badge = "LOCAL",
    },

    {
        id = "player_057",
        tab = "player",
        title = "Profile animation",
        description = "Profile details: profile animation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile details · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 8,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Profile details",
        badge = "PREVIEW",
    },

    {
        id = "player_058",
        tab = "player",
        title = "Player card · Soft",
        description = "Status presentation: player card · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · status presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Card",
        minimum = 0, maximum = 1, step = 1,
        options = {"Compact", "Card", "Badge", "Panel"},
        group = "Status presentation",
        badge = "STYLE",
    },

    {
        id = "world_001",
        tab = "world",
        title = "World tint",
        description = "Zone markers: world tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 20,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Zone markers",
        badge = "DEMO",
    },

    {
        id = "world_002",
        tab = "world",
        title = "Sky gradient",
        description = "World overlays: sky gradient с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "World overlays",
        badge = "UI ONLY",
    },

    {
        id = "world_003",
        tab = "world",
        title = "Ambient preview",
        description = "Preview ambience: ambient preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Night",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Preview ambience",
        badge = "VISUAL",
    },

    {
        id = "world_004",
        tab = "world",
        title = "Horizon line",
        description = "Sky presentation: horizon line с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "LOCAL",
    },

    {
        id = "world_005",
        tab = "world",
        title = "Fog card",
        description = "Light treatment: fog card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · light treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 48,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Light treatment",
        badge = "PREVIEW",
    },

    {
        id = "world_006",
        tab = "world",
        title = "Atmosphere hue",
        description = "Zone markers: atmosphere hue с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Zone markers",
        badge = "STYLE",
    },

    {
        id = "world_007",
        tab = "world",
        title = "Light bloom",
        description = "Preview ambience: light bloom с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "DEMO",
    },

    {
        id = "world_008",
        tab = "world",
        title = "Sun ring",
        description = "Environment colors: sun ring с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · environment colors · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Environment colors",
        badge = "UI ONLY",
    },

    {
        id = "world_009",
        tab = "world",
        title = "Moon marker",
        description = "Sky presentation: moon marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 76,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "VISUAL",
    },

    {
        id = "world_010",
        tab = "world",
        title = "Cloud opacity",
        description = "Zone markers: cloud opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Horizon",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Zone markers",
        badge = "LOCAL",
    },

    {
        id = "world_011",
        tab = "world",
        title = "World grid",
        description = "World overlays: world grid с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "World overlays",
        badge = "PREVIEW",
    },

    {
        id = "world_012",
        tab = "world",
        title = "Depth label",
        description = "Preview ambience: depth label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "STYLE",
    },

    {
        id = "world_013",
        tab = "world",
        title = "Zone outline",
        description = "Sky presentation: zone outline с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 3,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "DEMO",
    },

    {
        id = "world_014",
        tab = "world",
        title = "Area badge",
        description = "Light treatment: area badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · light treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Light treatment",
        badge = "UI ONLY",
    },

    {
        id = "world_015",
        tab = "world",
        title = "Environment card",
        description = "Zone markers: environment card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Night",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Zone markers",
        badge = "VISUAL",
    },

    {
        id = "world_016",
        tab = "world",
        title = "Light direction",
        description = "Preview ambience: light direction с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 24,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "LOCAL",
    },

    {
        id = "world_017",
        tab = "world",
        title = "Sky contrast",
        description = "Environment colors: sky contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · environment colors · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Environment colors",
        badge = "PREVIEW",
    },

    {
        id = "world_018",
        tab = "world",
        title = "Fog density",
        description = "Sky presentation: fog density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "STYLE",
    },

    {
        id = "world_019",
        tab = "world",
        title = "Horizon glow",
        description = "Zone markers: horizon glow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Zone markers",
        badge = "DEMO",
    },

    {
        id = "world_020",
        tab = "world",
        title = "Ambient tone",
        description = "World overlays: ambient tone с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 52,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "World overlays",
        badge = "UI ONLY",
    },

    {
        id = "world_021",
        tab = "world",
        title = "Zone marker",
        description = "Preview ambience: zone marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Aurora",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Preview ambience",
        badge = "VISUAL",
    },

    {
        id = "world_022",
        tab = "world",
        title = "Area label",
        description = "Sky presentation: area label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "LOCAL",
    },

    {
        id = "world_023",
        tab = "world",
        title = "Cloud tint",
        description = "Light treatment: cloud tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · light treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Light treatment",
        badge = "PREVIEW",
    },

    {
        id = "world_024",
        tab = "world",
        title = "Bloom radius",
        description = "Zone markers: bloom radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 80,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Zone markers",
        badge = "STYLE",
    },

    {
        id = "world_025",
        tab = "world",
        title = "Sun scale",
        description = "Preview ambience: sun scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "DEMO",
    },

    {
        id = "world_026",
        tab = "world",
        title = "Moon phase",
        description = "Environment colors: moon phase с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · environment colors · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Horizon",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Environment colors",
        badge = "UI ONLY",
    },

    {
        id = "world_027",
        tab = "world",
        title = "Grid opacity",
        description = "Sky presentation: grid opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "VISUAL",
    },

    {
        id = "world_028",
        tab = "world",
        title = "Depth format",
        description = "Zone markers: depth format с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 7,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Zone markers",
        badge = "LOCAL",
    },

    {
        id = "world_029",
        tab = "world",
        title = "Zone fill",
        description = "World overlays: zone fill с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "World overlays",
        badge = "PREVIEW",
    },

    {
        id = "world_030",
        tab = "world",
        title = "Area accent",
        description = "Preview ambience: area accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "STYLE",
    },

    {
        id = "world_031",
        tab = "world",
        title = "Environment hue",
        description = "Sky presentation: environment hue с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "DEMO",
    },

    {
        id = "world_032",
        tab = "world",
        title = "Light temperature",
        description = "Light treatment: light temperature с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · light treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 35,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Light treatment",
        badge = "UI ONLY",
    },

    {
        id = "world_033",
        tab = "world",
        title = "Sky preset",
        description = "Zone markers: sky preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Zone markers",
        badge = "VISUAL",
    },

    {
        id = "world_034",
        tab = "world",
        title = "Fog edge",
        description = "Preview ambience: fog edge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "LOCAL",
    },

    {
        id = "world_035",
        tab = "world",
        title = "Atmosphere fade",
        description = "Environment colors: atmosphere fade с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · environment colors · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 56,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Environment colors",
        badge = "PREVIEW",
    },

    {
        id = "world_036",
        tab = "world",
        title = "Cloud motion",
        description = "Sky presentation: cloud motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "STYLE",
    },

    {
        id = "world_037",
        tab = "world",
        title = "Sun flare",
        description = "Zone markers: sun flare с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Aurora",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Zone markers",
        badge = "DEMO",
    },

    {
        id = "world_038",
        tab = "world",
        title = "Moon glow",
        description = "World overlays: moon glow с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "World overlays",
        badge = "UI ONLY",
    },

    {
        id = "world_039",
        tab = "world",
        title = "Grid spacing",
        description = "Preview ambience: grid spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 84,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "VISUAL",
    },

    {
        id = "world_040",
        tab = "world",
        title = "Depth badge",
        description = "Sky presentation: depth badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "LOCAL",
    },

    {
        id = "world_041",
        tab = "world",
        title = "Zone border",
        description = "Light treatment: zone border с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · light treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Light treatment",
        badge = "PREVIEW",
    },

    {
        id = "world_042",
        tab = "world",
        title = "Area pulse",
        description = "Zone markers: area pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Zone markers",
        badge = "STYLE",
    },

    {
        id = "world_043",
        tab = "world",
        title = "World profile",
        description = "Preview ambience: world profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 11,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "DEMO",
    },

    {
        id = "world_044",
        tab = "world",
        title = "Environment preview",
        description = "Environment colors: environment preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · environment colors · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Prism",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Environment colors",
        badge = "UI ONLY",
    },

    {
        id = "world_045",
        tab = "world",
        title = "Light softness",
        description = "Sky presentation: light softness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "VISUAL",
    },

    {
        id = "world_046",
        tab = "world",
        title = "Horizon style",
        description = "Zone markers: horizon style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Zone markers",
        badge = "LOCAL",
    },

    {
        id = "world_047",
        tab = "world",
        title = "Sky texture",
        description = "World overlays: sky texture с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 39,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "World overlays",
        badge = "PREVIEW",
    },

    {
        id = "world_048",
        tab = "world",
        title = "Atmosphere profile",
        description = "Preview ambience: atmosphere profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "STYLE",
    },

    {
        id = "world_049",
        tab = "world",
        title = "Fog tint",
        description = "Sky presentation: fog tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Aurora",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Sky presentation",
        badge = "DEMO",
    },

    {
        id = "world_050",
        tab = "world",
        title = "Zone palette",
        description = "Light treatment: zone palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · light treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 60,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Light treatment",
        badge = "UI ONLY",
    },

    {
        id = "world_051",
        tab = "world",
        title = "World marker",
        description = "Zone markers: world marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Zone markers",
        badge = "VISUAL",
    },

    {
        id = "world_052",
        tab = "world",
        title = "Cloud profile",
        description = "Preview ambience: cloud profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "LOCAL",
    },

    {
        id = "world_053",
        tab = "world",
        title = "Sunset tint",
        description = "Environment colors: sunset tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · environment colors · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Environment colors",
        badge = "PREVIEW",
    },

    {
        id = "world_054",
        tab = "world",
        title = "Night grade",
        description = "Sky presentation: night grade с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 88,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "STYLE",
    },

    {
        id = "world_055",
        tab = "world",
        title = "World card",
        description = "Zone markers: world card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · zone markers · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Night",
        minimum = 0, maximum = 1, step = 1,
        options = {"Aurora", "Horizon", "Night", "Prism"},
        group = "Zone markers",
        badge = "DEMO",
    },

    {
        id = "world_056",
        tab = "world",
        title = "Light preset",
        description = "World overlays: light preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · world overlays · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "World overlays",
        badge = "UI ONLY",
    },

    {
        id = "world_057",
        tab = "world",
        title = "World palette",
        description = "Preview ambience: world palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preview ambience · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preview ambience",
        badge = "VISUAL",
    },

    {
        id = "world_058",
        tab = "world",
        title = "Preview horizon",
        description = "Sky presentation: preview horizon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · sky presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 15,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Sky presentation",
        badge = "LOCAL",
    },

    {
        id = "misc_001",
        tab = "misc",
        title = "Notification style",
        description = "Alerts and messages: notification style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "PREVIEW",
    },

    {
        id = "misc_002",
        tab = "misc",
        title = "Toast duration",
        description = "Session graphics: toast duration с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 27,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Session graphics",
        badge = "STYLE",
    },

    {
        id = "misc_003",
        tab = "misc",
        title = "Sound badge",
        description = "Quick actions: sound badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Quick actions",
        badge = "DEMO",
    },

    {
        id = "misc_004",
        tab = "misc",
        title = "Event queue",
        description = "Extra styling: event queue с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "UI ONLY",
    },

    {
        id = "misc_005",
        tab = "misc",
        title = "Quick action",
        description = "Utility widgets: quick action с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · utility widgets · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Utility widgets",
        badge = "VISUAL",
    },

    {
        id = "misc_006",
        tab = "misc",
        title = "Status banner",
        description = "Alerts and messages: status banner с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 55,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "LOCAL",
    },

    {
        id = "misc_007",
        tab = "misc",
        title = "Session card",
        description = "Quick actions: session card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Expressive",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Quick actions",
        badge = "PREVIEW",
    },

    {
        id = "misc_008",
        tab = "misc",
        title = "Clock format",
        description = "Event presentation: clock format с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · event presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Event presentation",
        badge = "STYLE",
    },

    {
        id = "misc_009",
        tab = "misc",
        title = "Toast position",
        description = "Extra styling: toast position с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 76,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Extra styling",
        badge = "DEMO",
    },

    {
        id = "misc_010",
        tab = "misc",
        title = "Alert tint",
        description = "Alerts and messages: alert tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "UI ONLY",
    },

    {
        id = "misc_011",
        tab = "misc",
        title = "Queue size",
        description = "Session graphics: queue size с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Expressive",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Session graphics",
        badge = "VISUAL",
    },

    {
        id = "misc_012",
        tab = "misc",
        title = "Event icon",
        description = "Quick actions: event icon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Quick actions",
        badge = "LOCAL",
    },

    {
        id = "misc_013",
        tab = "misc",
        title = "Action spacing",
        description = "Extra styling: action spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 3,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Extra styling",
        badge = "PREVIEW",
    },

    {
        id = "misc_014",
        tab = "misc",
        title = "Banner animation",
        description = "Utility widgets: banner animation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · utility widgets · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Utility widgets",
        badge = "STYLE",
    },

    {
        id = "misc_015",
        tab = "misc",
        title = "Session label",
        description = "Alerts and messages: session label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "DEMO",
    },

    {
        id = "misc_016",
        tab = "misc",
        title = "Clock accent",
        description = "Quick actions: clock accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Quick actions",
        badge = "UI ONLY",
    },

    {
        id = "misc_017",
        tab = "misc",
        title = "Toast radius",
        description = "Event presentation: toast radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · event presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 31,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Event presentation",
        badge = "VISUAL",
    },

    {
        id = "misc_018",
        tab = "misc",
        title = "Sound meter",
        description = "Extra styling: sound meter с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Standard",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Extra styling",
        badge = "LOCAL",
    },

    {
        id = "misc_019",
        tab = "misc",
        title = "Queue opacity",
        description = "Alerts and messages: queue opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "PREVIEW",
    },

    {
        id = "misc_020",
        tab = "misc",
        title = "Action icon",
        description = "Session graphics: action icon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Session graphics",
        badge = "STYLE",
    },

    {
        id = "misc_021",
        tab = "misc",
        title = "Alert duration",
        description = "Quick actions: alert duration с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 59,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Quick actions",
        badge = "DEMO",
    },

    {
        id = "misc_022",
        tab = "misc",
        title = "Banner height",
        description = "Extra styling: banner height с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "UI ONLY",
    },

    {
        id = "misc_023",
        tab = "misc",
        title = "Session border",
        description = "Utility widgets: session border с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · utility widgets · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Expressive",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Utility widgets",
        badge = "VISUAL",
    },

    {
        id = "misc_024",
        tab = "misc",
        title = "Clock layout",
        description = "Alerts and messages: clock layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "LOCAL",
    },

    {
        id = "misc_025",
        tab = "misc",
        title = "Toast motion",
        description = "Quick actions: toast motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 87,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Quick actions",
        badge = "PREVIEW",
    },

    {
        id = "misc_026",
        tab = "misc",
        title = "Meter gradient",
        description = "Event presentation: meter gradient с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · event presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Event presentation",
        badge = "STYLE",
    },

    {
        id = "misc_027",
        tab = "misc",
        title = "Queue marker",
        description = "Extra styling: queue marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "DEMO",
    },

    {
        id = "misc_028",
        tab = "misc",
        title = "Action card",
        description = "Alerts and messages: action card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 7,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "UI ONLY",
    },

    {
        id = "misc_029",
        tab = "misc",
        title = "Alert pulse",
        description = "Session graphics: alert pulse с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Subtle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Session graphics",
        badge = "VISUAL",
    },

    {
        id = "misc_030",
        tab = "misc",
        title = "Banner tint",
        description = "Quick actions: banner tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Quick actions",
        badge = "LOCAL",
    },

    {
        id = "misc_031",
        tab = "misc",
        title = "Session style",
        description = "Extra styling: session style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "PREVIEW",
    },

    {
        id = "misc_032",
        tab = "misc",
        title = "Clock scale",
        description = "Utility widgets: clock scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · utility widgets · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 35,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Utility widgets",
        badge = "STYLE",
    },

    {
        id = "misc_033",
        tab = "misc",
        title = "Toast preset",
        description = "Alerts and messages: toast preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "DEMO",
    },

    {
        id = "misc_034",
        tab = "misc",
        title = "Sound preview",
        description = "Quick actions: sound preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Standard",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Quick actions",
        badge = "UI ONLY",
    },

    {
        id = "misc_035",
        tab = "misc",
        title = "Queue motion",
        description = "Event presentation: queue motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · event presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Event presentation",
        badge = "VISUAL",
    },

    {
        id = "misc_036",
        tab = "misc",
        title = "Action feedback",
        description = "Extra styling: action feedback с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 63,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Extra styling",
        badge = "LOCAL",
    },

    {
        id = "misc_037",
        tab = "misc",
        title = "Alert icon",
        description = "Alerts and messages: alert icon с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "PREVIEW",
    },

    {
        id = "misc_038",
        tab = "misc",
        title = "Banner profile",
        description = "Session graphics: banner profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Session graphics",
        badge = "STYLE",
    },

    {
        id = "misc_039",
        tab = "misc",
        title = "Session accent",
        description = "Quick actions: session accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Quick actions",
        badge = "DEMO",
    },

    {
        id = "misc_040",
        tab = "misc",
        title = "Clock badge",
        description = "Extra styling: clock badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 91,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Extra styling",
        badge = "UI ONLY",
    },

    {
        id = "misc_041",
        tab = "misc",
        title = "Toast density",
        description = "Utility widgets: toast density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · utility widgets · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Subtle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Utility widgets",
        badge = "VISUAL",
    },

    {
        id = "misc_042",
        tab = "misc",
        title = "Sound palette",
        description = "Alerts and messages: sound palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "LOCAL",
    },

    {
        id = "misc_043",
        tab = "misc",
        title = "Queue layout",
        description = "Quick actions: queue layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 11,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Quick actions",
        badge = "PREVIEW",
    },

    {
        id = "misc_044",
        tab = "misc",
        title = "Quick panel",
        description = "Event presentation: quick panel с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · event presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Event presentation",
        badge = "STYLE",
    },

    {
        id = "misc_045",
        tab = "misc",
        title = "Alert preview",
        description = "Extra styling: alert preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Subtle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Extra styling",
        badge = "DEMO",
    },

    {
        id = "misc_046",
        tab = "misc",
        title = "Banner edge",
        description = "Alerts and messages: banner edge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "UI ONLY",
    },

    {
        id = "misc_047",
        tab = "misc",
        title = "Session timer",
        description = "Session graphics: session timer с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 39,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Session graphics",
        badge = "VISUAL",
    },

    {
        id = "misc_048",
        tab = "misc",
        title = "Clock preview",
        description = "Quick actions: clock preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Quick actions",
        badge = "LOCAL",
    },

    {
        id = "misc_049",
        tab = "misc",
        title = "Event styling",
        description = "Extra styling: event styling с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "PREVIEW",
    },

    {
        id = "misc_050",
        tab = "misc",
        title = "Quick menu",
        description = "Utility widgets: quick menu с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · utility widgets · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Utility widgets",
        badge = "STYLE",
    },

    {
        id = "misc_051",
        tab = "misc",
        title = "Status message",
        description = "Alerts and messages: status message с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 67,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "DEMO",
    },

    {
        id = "misc_052",
        tab = "misc",
        title = "Action preset",
        description = "Quick actions: action preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Quiet",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Quick actions",
        badge = "UI ONLY",
    },

    {
        id = "misc_053",
        tab = "misc",
        title = "Utility card",
        description = "Event presentation: utility card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · event presentation · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Event presentation",
        badge = "VISUAL",
    },

    {
        id = "misc_054",
        tab = "misc",
        title = "Notification stack",
        description = "Extra styling: notification stack с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "LOCAL",
    },

    {
        id = "misc_055",
        tab = "misc",
        title = "Misc palette",
        description = "Alerts and messages: misc palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · alerts and messages · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 95,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Alerts and messages",
        badge = "PREVIEW",
    },

    {
        id = "misc_056",
        tab = "misc",
        title = "Event profile",
        description = "Session graphics: event profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · session graphics · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Session graphics",
        badge = "STYLE",
    },

    {
        id = "misc_057",
        tab = "misc",
        title = "Extra layout",
        description = "Quick actions: extra layout с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · quick actions · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Subtle",
        minimum = 0, maximum = 1, step = 1,
        options = {"Subtle", "Standard", "Expressive", "Quiet"},
        group = "Quick actions",
        badge = "DEMO",
    },

    {
        id = "misc_058",
        tab = "misc",
        title = "Notification style · Soft",
        description = "Extra styling: notification style · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · extra styling · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Extra styling",
        badge = "UI ONLY",
    },

    {
        id = "themes_001",
        tab = "themes",
        title = "Accent balance",
        description = "Surface treatment: accent balance с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "VISUAL",
    },

    {
        id = "themes_002",
        tab = "themes",
        title = "Surface contrast",
        description = "Color and palette: surface contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 27,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Color and palette",
        badge = "LOCAL",
    },

    {
        id = "themes_003",
        tab = "themes",
        title = "Glass opacity",
        description = "Motion preferences: glass opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "High",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Motion preferences",
        badge = "PREVIEW",
    },

    {
        id = "themes_004",
        tab = "themes",
        title = "Window radius",
        description = "Geometry tuning: window radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "STYLE",
    },

    {
        id = "themes_005",
        tab = "themes",
        title = "Card radius",
        description = "Typography: card radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · typography · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Typography",
        badge = "DEMO",
    },

    {
        id = "themes_006",
        tab = "themes",
        title = "Button radius",
        description = "Surface treatment: button radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 55,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "UI ONLY",
    },

    {
        id = "themes_007",
        tab = "themes",
        title = "Glow strength",
        description = "Motion preferences: glow strength с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "VISUAL",
    },

    {
        id = "themes_008",
        tab = "themes",
        title = "Glow spread",
        description = "Background effects: glow spread с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · background effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Adaptive",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Background effects",
        badge = "LOCAL",
    },

    {
        id = "themes_009",
        tab = "themes",
        title = "Gradient angle",
        description = "Geometry tuning: gradient angle с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "PREVIEW",
    },

    {
        id = "themes_010",
        tab = "themes",
        title = "Gradient speed",
        description = "Surface treatment: gradient speed с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 83,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "STYLE",
    },

    {
        id = "themes_011",
        tab = "themes",
        title = "Background depth",
        description = "Color and palette: background depth с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color and palette",
        badge = "DEMO",
    },

    {
        id = "themes_012",
        tab = "themes",
        title = "Particle count",
        description = "Motion preferences: particle count с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "UI ONLY",
    },

    {
        id = "themes_013",
        tab = "themes",
        title = "Particle scale",
        description = "Geometry tuning: particle scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "VISUAL",
    },

    {
        id = "themes_014",
        tab = "themes",
        title = "Grid visibility",
        description = "Typography: grid visibility с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · typography · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 10,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Typography",
        badge = "LOCAL",
    },

    {
        id = "themes_015",
        tab = "themes",
        title = "Grid density",
        description = "Surface treatment: grid density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "High",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Surface treatment",
        badge = "PREVIEW",
    },

    {
        id = "themes_016",
        tab = "themes",
        title = "Orbit scale",
        description = "Motion preferences: orbit scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "STYLE",
    },

    {
        id = "themes_017",
        tab = "themes",
        title = "Orbit speed",
        description = "Background effects: orbit speed с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · background effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Background effects",
        badge = "DEMO",
    },

    {
        id = "themes_018",
        tab = "themes",
        title = "Motion pacing",
        description = "Geometry tuning: motion pacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 38,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "UI ONLY",
    },

    {
        id = "themes_019",
        tab = "themes",
        title = "Reduced motion",
        description = "Surface treatment: reduced motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "High",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Surface treatment",
        badge = "VISUAL",
    },

    {
        id = "themes_020",
        tab = "themes",
        title = "UI scale",
        description = "Color and palette: ui scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color and palette",
        badge = "LOCAL",
    },

    {
        id = "themes_021",
        tab = "themes",
        title = "Compact rows",
        description = "Motion preferences: compact rows с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 59,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "PREVIEW",
    },

    {
        id = "themes_022",
        tab = "themes",
        title = "Description visibility",
        description = "Geometry tuning: description visibility с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "STYLE",
    },

    {
        id = "themes_023",
        tab = "themes",
        title = "Badge visibility",
        description = "Typography: badge visibility с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · typography · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Typography",
        badge = "DEMO",
    },

    {
        id = "themes_024",
        tab = "themes",
        title = "Glass surface",
        description = "Surface treatment: glass surface с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "UI ONLY",
    },

    {
        id = "themes_025",
        tab = "themes",
        title = "Background style",
        description = "Motion preferences: background style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 87,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "VISUAL",
    },

    {
        id = "themes_026",
        tab = "themes",
        title = "Palette preset",
        description = "Background effects: palette preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · background effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Medium",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Background effects",
        badge = "LOCAL",
    },

    {
        id = "themes_027",
        tab = "themes",
        title = "Shadow depth",
        description = "Geometry tuning: shadow depth с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "PREVIEW",
    },

    {
        id = "themes_028",
        tab = "themes",
        title = "Border intensity",
        description = "Surface treatment: border intensity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "STYLE",
    },

    {
        id = "themes_029",
        tab = "themes",
        title = "Panel opacity",
        description = "Color and palette: panel opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 14,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Color and palette",
        badge = "DEMO",
    },

    {
        id = "themes_030",
        tab = "themes",
        title = "Card contrast",
        description = "Motion preferences: card contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "UI ONLY",
    },

    {
        id = "themes_031",
        tab = "themes",
        title = "Highlight softness",
        description = "Geometry tuning: highlight softness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "High",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Geometry tuning",
        badge = "VISUAL",
    },

    {
        id = "themes_032",
        tab = "themes",
        title = "Corner profile",
        description = "Typography: corner profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · typography · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Typography",
        badge = "LOCAL",
    },

    {
        id = "themes_033",
        tab = "themes",
        title = "Window spacing",
        description = "Surface treatment: window spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 42,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "PREVIEW",
    },

    {
        id = "themes_034",
        tab = "themes",
        title = "Nav width",
        description = "Motion preferences: nav width с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "STYLE",
    },

    {
        id = "themes_035",
        tab = "themes",
        title = "Header height",
        description = "Background effects: header height с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · background effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Background effects",
        badge = "DEMO",
    },

    {
        id = "themes_036",
        tab = "themes",
        title = "Content padding",
        description = "Geometry tuning: content padding с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 63,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "UI ONLY",
    },

    {
        id = "themes_037",
        tab = "themes",
        title = "Row spacing",
        description = "Surface treatment: row spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Low",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Surface treatment",
        badge = "VISUAL",
    },

    {
        id = "themes_038",
        tab = "themes",
        title = "Font scale",
        description = "Color and palette: font scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color and palette",
        badge = "LOCAL",
    },

    {
        id = "themes_039",
        tab = "themes",
        title = "Text contrast",
        description = "Motion preferences: text contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "PREVIEW",
    },

    {
        id = "themes_040",
        tab = "themes",
        title = "Muted contrast",
        description = "Geometry tuning: muted contrast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 91,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "STYLE",
    },

    {
        id = "themes_041",
        tab = "themes",
        title = "Accent saturation",
        description = "Typography: accent saturation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · typography · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Typography",
        badge = "DEMO",
    },

    {
        id = "themes_042",
        tab = "themes",
        title = "Accent brightness",
        description = "Surface treatment: accent brightness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Medium",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Surface treatment",
        badge = "UI ONLY",
    },

    {
        id = "themes_043",
        tab = "themes",
        title = "Background shade",
        description = "Motion preferences: background shade с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "VISUAL",
    },

    {
        id = "themes_044",
        tab = "themes",
        title = "Surface shade",
        description = "Background effects: surface shade с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · background effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 18,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Background effects",
        badge = "LOCAL",
    },

    {
        id = "themes_045",
        tab = "themes",
        title = "Particle drift",
        description = "Geometry tuning: particle drift с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "PREVIEW",
    },

    {
        id = "themes_046",
        tab = "themes",
        title = "Aurora intensity",
        description = "Surface treatment: aurora intensity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "STYLE",
    },

    {
        id = "themes_047",
        tab = "themes",
        title = "Orbit opacity",
        description = "Color and palette: orbit opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color and palette",
        badge = "DEMO",
    },

    {
        id = "themes_048",
        tab = "themes",
        title = "Prism tint",
        description = "Motion preferences: prism tint с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 46,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "UI ONLY",
    },

    {
        id = "themes_049",
        tab = "themes",
        title = "Grid opacity",
        description = "Geometry tuning: grid opacity с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Low",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Geometry tuning",
        badge = "VISUAL",
    },

    {
        id = "themes_050",
        tab = "themes",
        title = "Animation curve",
        description = "Typography: animation curve с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · typography · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Typography",
        badge = "LOCAL",
    },

    {
        id = "themes_051",
        tab = "themes",
        title = "Animation duration",
        description = "Surface treatment: animation duration с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "PREVIEW",
    },

    {
        id = "themes_052",
        tab = "themes",
        title = "Hover response",
        description = "Motion preferences: hover response с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 74,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "STYLE",
    },

    {
        id = "themes_053",
        tab = "themes",
        title = "Press response",
        description = "Background effects: press response с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · background effects · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Low",
        minimum = 0, maximum = 1, step = 1,
        options = {"Low", "Medium", "High", "Adaptive"},
        group = "Background effects",
        badge = "DEMO",
    },

    {
        id = "themes_054",
        tab = "themes",
        title = "Popup radius",
        description = "Geometry tuning: popup radius с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "UI ONLY",
    },

    {
        id = "themes_055",
        tab = "themes",
        title = "Toast style",
        description = "Surface treatment: toast style с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · surface treatment · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 95,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Surface treatment",
        badge = "VISUAL",
    },

    {
        id = "themes_056",
        tab = "themes",
        title = "Scroll thickness",
        description = "Color and palette: scroll thickness с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · color and palette · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Color and palette",
        badge = "LOCAL",
    },

    {
        id = "themes_057",
        tab = "themes",
        title = "Theme preview",
        description = "Motion preferences: theme preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · motion preferences · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Motion preferences",
        badge = "PREVIEW",
    },

    {
        id = "themes_058",
        tab = "themes",
        title = "Accent balance · Soft",
        description = "Geometry tuning: accent balance · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · geometry tuning · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Geometry tuning",
        badge = "STYLE",
    },

    {
        id = "config_001",
        tab = "config",
        title = "Active profile",
        description = "Preset previews: active profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "DEMO",
    },

    {
        id = "config_002",
        tab = "config",
        title = "Profile label",
        description = "Build information: profile label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Build information",
        badge = "UI ONLY",
    },

    {
        id = "config_003",
        tab = "config",
        title = "Palette slot",
        description = "Reset controls: palette slot с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 34,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Reset controls",
        badge = "VISUAL",
    },

    {
        id = "config_004",
        tab = "config",
        title = "Background preset",
        description = "Saved appearance: background preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "LOCAL",
    },

    {
        id = "config_005",
        tab = "config",
        title = "Animation preset",
        description = "Local defaults: animation preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · local defaults · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Default",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Local defaults",
        badge = "PREVIEW",
    },

    {
        id = "config_006",
        tab = "config",
        title = "Scale preset",
        description = "Preset previews: scale preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "STYLE",
    },

    {
        id = "config_007",
        tab = "config",
        title = "Layout preset",
        description = "Reset controls: layout preset с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 62,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Reset controls",
        badge = "DEMO",
    },

    {
        id = "config_008",
        tab = "config",
        title = "Saved state",
        description = "Profile management: saved state с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile management · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile management",
        badge = "UI ONLY",
    },

    {
        id = "config_009",
        tab = "config",
        title = "Session state",
        description = "Saved appearance: session state с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "VISUAL",
    },

    {
        id = "config_010",
        tab = "config",
        title = "Restore values",
        description = "Preset previews: restore values с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "LOCAL",
    },

    {
        id = "config_011",
        tab = "config",
        title = "Default values",
        description = "Build information: default values с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 90,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Build information",
        badge = "PREVIEW",
    },

    {
        id = "config_012",
        tab = "config",
        title = "Compact profile",
        description = "Reset controls: compact profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reset controls",
        badge = "STYLE",
    },

    {
        id = "config_013",
        tab = "config",
        title = "Touch profile",
        description = "Saved appearance: touch profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "DEMO",
    },

    {
        id = "config_014",
        tab = "config",
        title = "Wide profile",
        description = "Local defaults: wide profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · local defaults · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 10,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Local defaults",
        badge = "UI ONLY",
    },

    {
        id = "config_015",
        tab = "config",
        title = "Minimal profile",
        description = "Preset previews: minimal profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "VISUAL",
    },

    {
        id = "config_016",
        tab = "config",
        title = "Studio profile",
        description = "Reset controls: studio profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Wide",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Reset controls",
        badge = "LOCAL",
    },

    {
        id = "config_017",
        tab = "config",
        title = "Glass profile",
        description = "Profile management: glass profile с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile management · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile management",
        badge = "PREVIEW",
    },

    {
        id = "config_018",
        tab = "config",
        title = "Color snapshot",
        description = "Saved appearance: color snapshot с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 38,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "STYLE",
    },

    {
        id = "config_019",
        tab = "config",
        title = "Layout snapshot",
        description = "Preset previews: layout snapshot с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "DEMO",
    },

    {
        id = "config_020",
        tab = "config",
        title = "Motion snapshot",
        description = "Build information: motion snapshot с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Build information",
        badge = "UI ONLY",
    },

    {
        id = "config_021",
        tab = "config",
        title = "Profile badge",
        description = "Reset controls: profile badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reset controls",
        badge = "VISUAL",
    },

    {
        id = "config_022",
        tab = "config",
        title = "Config card",
        description = "Saved appearance: config card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 66,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "LOCAL",
    },

    {
        id = "config_023",
        tab = "config",
        title = "Preset label",
        description = "Local defaults: preset label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · local defaults · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Minimal",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Local defaults",
        badge = "PREVIEW",
    },

    {
        id = "config_024",
        tab = "config",
        title = "Preset spacing",
        description = "Preset previews: preset spacing с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "STYLE",
    },

    {
        id = "config_025",
        tab = "config",
        title = "Profile outline",
        description = "Reset controls: profile outline с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reset controls",
        badge = "DEMO",
    },

    {
        id = "config_026",
        tab = "config",
        title = "Profile accent",
        description = "Profile management: profile accent с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile management · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 94,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Profile management",
        badge = "UI ONLY",
    },

    {
        id = "config_027",
        tab = "config",
        title = "Saved marker",
        description = "Saved appearance: saved marker с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "VISUAL",
    },

    {
        id = "config_028",
        tab = "config",
        title = "Restore badge",
        description = "Preset previews: restore badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Wide",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Preset previews",
        badge = "LOCAL",
    },

    {
        id = "config_029",
        tab = "config",
        title = "Reset animation",
        description = "Build information: reset animation с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 14,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Build information",
        badge = "PREVIEW",
    },

    {
        id = "config_030",
        tab = "config",
        title = "Default palette",
        description = "Reset controls: default palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reset controls",
        badge = "STYLE",
    },

    {
        id = "config_031",
        tab = "config",
        title = "Default background",
        description = "Saved appearance: default background с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "DEMO",
    },

    {
        id = "config_032",
        tab = "config",
        title = "Default scale",
        description = "Local defaults: default scale с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · local defaults · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Local defaults",
        badge = "UI ONLY",
    },

    {
        id = "config_033",
        tab = "config",
        title = "Default motion",
        description = "Preset previews: default motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 42,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preset previews",
        badge = "VISUAL",
    },

    {
        id = "config_034",
        tab = "config",
        title = "Profile list",
        description = "Reset controls: profile list с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Studio",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Reset controls",
        badge = "LOCAL",
    },

    {
        id = "config_035",
        tab = "config",
        title = "Profile selector",
        description = "Profile management: profile selector с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile management · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile management",
        badge = "PREVIEW",
    },

    {
        id = "config_036",
        tab = "config",
        title = "Quick apply",
        description = "Saved appearance: quick apply с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "STYLE",
    },

    {
        id = "config_037",
        tab = "config",
        title = "Config preview",
        description = "Preset previews: config preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 70,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Preset previews",
        badge = "DEMO",
    },

    {
        id = "config_038",
        tab = "config",
        title = "Config summary",
        description = "Build information: config summary с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Build information",
        badge = "UI ONLY",
    },

    {
        id = "config_039",
        tab = "config",
        title = "Local values",
        description = "Reset controls: local values с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Minimal",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Reset controls",
        badge = "VISUAL",
    },

    {
        id = "config_040",
        tab = "config",
        title = "Session label",
        description = "Saved appearance: session label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "LOCAL",
    },

    {
        id = "config_041",
        tab = "config",
        title = "Version badge",
        description = "Local defaults: version badge с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · local defaults · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 98,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Local defaults",
        badge = "PREVIEW",
    },

    {
        id = "config_042",
        tab = "config",
        title = "Build string",
        description = "Preset previews: build string с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "STYLE",
    },

    {
        id = "config_043",
        tab = "config",
        title = "Info card",
        description = "Reset controls: info card с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = true,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Reset controls",
        badge = "DEMO",
    },

    {
        id = "config_044",
        tab = "config",
        title = "Export preview",
        description = "Profile management: export preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile management · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile management",
        badge = "UI ONLY",
    },

    {
        id = "config_045",
        tab = "config",
        title = "Import preview",
        description = "Saved appearance: import preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 25,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "VISUAL",
    },

    {
        id = "config_046",
        tab = "config",
        title = "Reset prompt",
        description = "Preset previews: reset prompt с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "LOCAL",
    },

    {
        id = "config_047",
        tab = "config",
        title = "Restore panel",
        description = "Build information: restore panel с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Build information",
        badge = "PREVIEW",
    },

    {
        id = "config_048",
        tab = "config",
        title = "Profile status",
        description = "Reset controls: profile status с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 46,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Reset controls",
        badge = "STYLE",
    },

    {
        id = "config_049",
        tab = "config",
        title = "Saved indicator",
        description = "Saved appearance: saved indicator с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "DEMO",
    },

    {
        id = "config_050",
        tab = "config",
        title = "Config toast",
        description = "Local defaults: config toast с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · local defaults · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Studio",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Local defaults",
        badge = "UI ONLY",
    },

    {
        id = "config_051",
        tab = "config",
        title = "Preset color",
        description = "Preset previews: preset color с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "VISUAL",
    },

    {
        id = "config_052",
        tab = "config",
        title = "Profile motion",
        description = "Reset controls: profile motion с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 74,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Reset controls",
        badge = "LOCAL",
    },

    {
        id = "config_053",
        tab = "config",
        title = "State summary",
        description = "Profile management: state summary с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · profile management · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "action",
        defaultValue = 0,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Profile management",
        badge = "PREVIEW",
    },

    {
        id = "config_054",
        tab = "config",
        title = "Config density",
        description = "Saved appearance: config density с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "STYLE",
    },

    {
        id = "config_055",
        tab = "config",
        title = "About label",
        description = "Preset previews: about label с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · preset previews · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Preset previews",
        badge = "DEMO",
    },

    {
        id = "config_056",
        tab = "config",
        title = "Build preview",
        description = "Build information: build preview с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · build information · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "slider",
        defaultValue = 1,
        minimum = 0, maximum = 100, step = 1,
        options = {},
        group = "Build information",
        badge = "UI ONLY",
    },

    {
        id = "config_057",
        tab = "config",
        title = "Config palette",
        description = "Reset controls: config palette с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · reset controls · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "dropdown",
        defaultValue = "Default",
        minimum = 0, maximum = 1, step = 1,
        options = {"Default", "Studio", "Minimal", "Wide"},
        group = "Reset controls",
        badge = "VISUAL",
    },

    {
        id = "config_058",
        tab = "config",
        title = "Active profile · Soft",
        description = "Saved appearance: active profile · soft с аккуратно настроенной визуальной иерархией, плавной обратной связью и поведением, подходящим для сенсорного экрана.",
        detail = "Визуальный прототип · saved appearance · состояние хранится локально в текущей сессии; настройка не меняет игровую механику и служит для проверки внешнего вида.",
        kind = "toggle",
        defaultValue = false,
        minimum = 0, maximum = 1, step = 1,
        options = {},
        group = "Saved appearance",
        badge = "LOCAL",
    },

}

local state = {
    values = {},
    activeTab = "visuals",
    searchQuery = "",
    themeName = "Aquamarine",
    backgroundStyle = "Aurora",
    animationSpeed = 1,
    uiScale = 1,
    cornerSize = 14,
    backgroundOpacity = 0.16,
    particleEffects = true,
    gridEffects = true,
    glowEffects = true,
    reducedMotion = false,
    compactRows = false,
    showDescriptions = true,
    showTinyBadges = true,
    glassMode = true,
    profileName = "Aquamarine Night",
    minimized = false,
    visible = true,
    toastIndex = 0,
    selectionIndex = 1,
}

local featureById = {}
local tabById = {}
local uiObjects = {}
local tabButtons = {}
local currentRows = {}
local connections = {}
local pageConnections = {}
local sliderDrag = nil
local windowDrag = nil
local windowDragOrigin = nil
local windowPositionOrigin = nil
local palette = THEMES[state.themeName]
local setTheme
local setBackgroundStyle
local renderTab
local refreshResponsiveLayout
local updateFeatureCount
local showToast
local registerConnection

for _, tab in ipairs(TABS) do
    tabById[tab.id] = tab
end

for _, item in ipairs(FEATURES) do
    featureById[item.id] = item
    state.values[item.id] = item.defaultValue
end

local function clamp(value, minimum, maximum)
    return math.max(minimum, math.min(maximum, value))
end

local function round(value)
    return math.floor(value + 0.5)
end

local function formatNumber(value)
    if type(value) ~= "number" then
        return tostring(value)
    end
    if math.abs(value) >= 1000 then
        return string.format("%.1fk", value / 1000)
    end
    if value % 1 == 0 then
        return tostring(round(value))
    end
    return string.format("%.2f", value)
end

local function safeDisconnect(connection)
    if connection then
        pcall(function()
            connection:Disconnect()
        end)
    end
end

registerConnection = function(connection)
    table.insert(connections, connection)
    return connection
end

local function registerPageConnection(connection)
    table.insert(pageConnections, connection)
    return connection
end

local function make(className, properties, parent)
    local object = Instance.new(className)
    for key, value in pairs(properties or {}) do
        object[key] = value
    end
    if parent then
        object.Parent = parent
    end
    return object
end

local function setRole(object, role)
    if object then
        object:SetAttribute("AquaRole", role)
    end
    return object
end

local function setTextRole(object, role)
    if object then
        object:SetAttribute("AquaTextRole", role)
    end
    return object
end

local function addCorner(parent, radius)
    return make("UICorner", { CornerRadius = UDim.new(0, radius or state.cornerSize) }, parent)
end

local function addStroke(parent, role, thickness, transparency)
    local stroke = make("UIStroke", {
        Thickness = thickness or 1,
        Transparency = transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
    setRole(stroke, role or "border")
    return stroke
end

local function addPadding(parent, left, top, right, bottom)
    return make("UIPadding", {
        PaddingLeft = UDim.new(0, left or 0),
        PaddingTop = UDim.new(0, top or 0),
        PaddingRight = UDim.new(0, right or 0),
        PaddingBottom = UDim.new(0, bottom or 0),
    }, parent)
end

local function addList(parent, direction, gap, horizontalAlignment, verticalAlignment)
    local list = make("UIListLayout", {
        FillDirection = direction or Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, gap or 0),
        HorizontalAlignment = horizontalAlignment or Enum.HorizontalAlignment.Left,
        VerticalAlignment = verticalAlignment or Enum.VerticalAlignment.Top,
    }, parent)
    return list
end

local function addGradient(parent, firstColor, secondColor, rotation)
    local gradient = make("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, firstColor),
            ColorSequenceKeypoint.new(1, secondColor),
        }),
        Rotation = rotation or 0,
    }, parent)
    return gradient
end

local function tween(object, duration, properties, style, direction)
    if not object or not object.Parent then
        return nil
    end
    local actualDuration = state.reducedMotion and 0.01 or math.max(0.01, duration / math.max(0.2, state.animationSpeed))
    local info = TweenInfo.new(actualDuration, style or Enum.EasingStyle.Quint, direction or Enum.EasingDirection.Out)
    local created = TweenService:Create(object, info, properties)
    created:Play()
    return created
end

local function makeLabel(parent, text, size, font, colorRole, alignment)
    local label = make("TextLabel", {
        BackgroundTransparency = 1,
        Size = size or UDim2.new(1, 0, 0, 22),
        Text = tostring(text or ""),
        Font = font or Enum.Font.Gotham,
        TextColor3 = palette.text,
        TextSize = 12,
        TextXAlignment = alignment or Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextWrapped = false,
        RichText = false,
        ClipsDescendants = true,
    }, parent)
    setRole(label, colorRole or "text")
    return label
end

local function makeTextButton(parent, text, size, role, textRole, font)
    local button = make("TextButton", {
        AutoButtonColor = false,
        BackgroundColor3 = palette.card,
        BorderSizePixel = 0,
        Size = size or UDim2.fromOffset(80, 32),
        Text = tostring(text or ""),
        Font = font or Enum.Font.GothamMedium,
        TextColor3 = palette.text,
        TextSize = 12,
        TextWrapped = false,
        ClipsDescendants = true,
        Selectable = true,
    }, parent)
    setRole(button, role or "card")
    setTextRole(button, textRole or "text")
    addCorner(button, 9)
    local scale = make("UIScale", { Scale = 1 }, button)
    local originalRole = role or "card"
    registerConnection(button.MouseEnter:Connect(function()
        if not UserInputService.TouchEnabled then
            tween(scale, 0.13, { Scale = 1.025 }, Enum.EasingStyle.Quad)
            if originalRole == "card" then
                setRole(button, "raised")
                button.BackgroundColor3 = palette.raised
            end
        end
    end))
    registerConnection(button.MouseLeave:Connect(function()
        tween(scale, 0.14, { Scale = 1 }, Enum.EasingStyle.Quad)
        if originalRole == "card" then
            button.BackgroundColor3 = palette.card
        end
    end))
    registerConnection(button.Activated:Connect(function()
        tween(scale, 0.08, { Scale = 0.96 }, Enum.EasingStyle.Quad)
        task.delay(0.09, function()
            if scale.Parent then
                tween(scale, 0.18, { Scale = 1 }, Enum.EasingStyle.Back)
            end
        end)
    end))
    return button
end

local function makePanel(parent, size, role, radius)
    local frame = make("Frame", {
        BackgroundColor3 = palette.panel,
        BorderSizePixel = 0,
        Size = size or UDim2.new(1, 0, 0, 100),
        ClipsDescendants = true,
    }, parent)
    setRole(frame, role or "panel")
    addCorner(frame, radius or state.cornerSize)
    addStroke(frame, "border", 1, 0.25)
    return frame
end

local function findTab(id)
    for _, tab in ipairs(TABS) do
        if tab.id == id then
            return tab
        end
    end
    return TABS[1]
end

local function findFeatureCount(tabId, query)
    local count = 0
    local normalized = string.lower(query or "")
    for _, item in ipairs(FEATURES) do
        local matchTab = not tabId or item.tab == tabId
        local matchQuery = normalized == "" or string.find(string.lower(item.title .. " " .. item.description .. " " .. item.detail .. " " .. item.group), normalized, 1, true) ~= nil
        if matchTab and matchQuery then
            count += 1
        end
    end
    return count
end

local function rowMatches(item, query)
    if query == nil or query == "" then
        return true
    end
    local q = string.lower(query)
    local combined = string.lower(item.title .. " " .. item.description .. " " .. item.detail .. " " .. item.group .. " " .. item.badge)
    return string.find(combined, q, 1, true) ~= nil
end

local function setFeatureValue(item, value, quiet)
    if not item then
        return
    end
    if item.kind == "toggle" then
        value = value == true
    elseif item.kind == "slider" then
        value = clamp(tonumber(value) or item.defaultValue or 0, item.minimum or 0, item.maximum or 100)
        if item.step and item.step > 0 then
            value = round(value / item.step) * item.step
        end
    elseif item.kind == "dropdown" then
        local found = false
        for _, option in ipairs(item.options) do
            if option == value then
                found = true
            end
        end
        if not found then
            value = item.options[1]
        end
    end
    state.values[item.id] = value
    local binding = item._binding
    if binding and binding.refresh then
        binding.refresh(value)
    end
    if not quiet then
        showToast(item.title .. "  ·  " .. tostring(value), "accent")
    end
end

local screenGui = make("ScreenGui", {
    Name = "AquamarineCreativeInterface",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 900,
}, PlayerGui)

local root = make("Frame", {
    Name = "Root",
    BackgroundColor3 = palette.background,
    BackgroundTransparency = state.backgroundOpacity,
    BorderSizePixel = 0,
    Size = UDim2.fromScale(1, 1),
    ClipsDescendants = true,
}, screenGui)
setRole(root, "background")

local backgroundGradient = addGradient(root, palette.background, palette.panel, 25)
setRole(backgroundGradient, "backgroundGradient")

local backgroundFx = make("Frame", {
    Name = "BackgroundFX",
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
    ClipsDescendants = true,
}, root)

local orbLayer = make("Frame", {
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
}, backgroundFx)

local orbSpecs = {
    { x = 0.10, y = 0.13, size = 250, alpha = 0.88, rotation = 22 },
    { x = 0.79, y = 0.23, size = 330, alpha = 0.91, rotation = 140 },
    { x = 0.49, y = 0.86, size = 280, alpha = 0.92, rotation = 280 },
    { x = 0.92, y = 0.89, size = 210, alpha = 0.94, rotation = 70 },
}

local orbs = {}
for index, spec in ipairs(orbSpecs) do
    local orb = make("Frame", {
        Name = "AuroraOrb" .. tostring(index),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(spec.x, spec.y),
        Size = UDim2.fromOffset(spec.size, spec.size),
        BackgroundColor3 = palette.accent,
        BackgroundTransparency = spec.alpha,
        BorderSizePixel = 0,
        Rotation = spec.rotation,
    }, orbLayer)
    addCorner(orb, spec.size)
    local grad = addGradient(orb, palette.accent, palette.accent2, spec.rotation)
    setRole(orb, "orb")
    setRole(grad, "orbGradient")
    orbs[index] = orb
end

local gridLayer = make("Frame", {
    Name = "GridLayer",
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
}, backgroundFx)

local gridLines = {}
for index = 1, 21 do
    local line = make("Frame", {
        Name = "GridV" .. tostring(index),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(index / 22, 0, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundColor3 = palette.accent,
        BackgroundTransparency = 0.94,
        BorderSizePixel = 0,
    }, gridLayer)
    setRole(line, "grid")
    table.insert(gridLines, line)
end

for index = 1, 13 do
    local line = make("Frame", {
        Name = "GridH" .. tostring(index),
        Position = UDim2.new(0, 0, index / 14, 0),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = palette.accent,
        BackgroundTransparency = 0.94,
        BorderSizePixel = 0,
    }, gridLayer)
    setRole(line, "grid")
    table.insert(gridLines, line)
end

local orbitLayer = make("Frame", {
    Name = "OrbitLayer",
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
}, backgroundFx)

local orbitShapes = {}
for index = 1, 4 do
    local diameter = 100 + index * 90
    local ring = make("Frame", {
        Name = "OrbitRing" .. tostring(index),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(diameter, diameter),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
    }, orbitLayer)
    addCorner(ring, diameter)
    local ringStroke = addStroke(ring, "orbit", 1, 0.7 + index * 0.04)
    orbitShapes[index] = { frame = ring, stroke = ringStroke }
end

local particleLayer = make("Frame", {
    Name = "ParticleLayer",
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
    ClipsDescendants = true,
}, backgroundFx)

local particles = {}
local random = Random.new()
for index = 1, 42 do
    local size = random:NextInteger(2, 5)
    local dot = make("Frame", {
        Name = "LightParticle" .. tostring(index),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(random:NextNumber(), random:NextNumber()),
        Size = UDim2.fromOffset(size, size),
        BackgroundColor3 = palette.accent3,
        BackgroundTransparency = random:NextNumber(0.35, 0.76),
        BorderSizePixel = 0,
    }, particleLayer)
    addCorner(dot, size)
    setRole(dot, "particle")
    particles[index] = dot
end

local mainWindow = make("Frame", {
    Name = "MainWindow",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(860, 680),
    BackgroundColor3 = palette.window,
    BackgroundTransparency = 0.03,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, root)
setRole(mainWindow, "window")
addCorner(mainWindow, 17)
local windowStroke = addStroke(mainWindow, "border", 1, 0.08)
local windowScale = make("UIScale", { Scale = 0.92 }, mainWindow)

local windowGlow = make("Frame", {
    Name = "TopGlow",
    BackgroundColor3 = palette.accent,
    BackgroundTransparency = 0.68,
    BorderSizePixel = 0,
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(1, 0, 0, 2),
    ZIndex = 5,
}, mainWindow)
setRole(windowGlow, "glow")
addGradient(windowGlow, palette.accent, palette.accent3, 0)

local topbar = make("Frame", {
    Name = "Topbar",
    BackgroundColor3 = palette.panel,
    BorderSizePixel = 0,
    Size = UDim2.new(1, 0, 0, 58),
    ZIndex = 2,
}, mainWindow)
setRole(topbar, "header")
local topbarGradient = addGradient(topbar, palette.panel, palette.window, 0)
setRole(topbarGradient, "headerGradient")

local brandMark = make("Frame", {
    Name = "BrandMark",
    Position = UDim2.new(0, 14, 0, 12),
    Size = UDim2.fromOffset(34, 34),
    BackgroundColor3 = palette.accent,
    BorderSizePixel = 0,
}, topbar)
setRole(brandMark, "accent")
addCorner(brandMark, 11)
addStroke(brandMark, "accent3", 1, 0.4)
local brandGlyph = makeLabel(brandMark, "A", UDim2.fromScale(1, 1), Enum.Font.GothamBlack, "accentText", Enum.TextXAlignment.Center)
brandGlyph.TextSize = 19

local brandTitle = makeLabel(topbar, APP_NAME, UDim2.new(0, 160, 0, 22), Enum.Font.GothamBlack, "text")
brandTitle.Position = UDim2.new(0, 57, 0, 9)
brandTitle.TextSize = 14
brandTitle.TextYAlignment = Enum.TextYAlignment.Bottom

local brandSubtitle = makeLabel(topbar, APP_EDITION, UDim2.new(0, 190, 0, 15), Enum.Font.GothamMedium, "muted")
brandSubtitle.Position = UDim2.new(0, 58, 0, 31)
brandSubtitle.TextSize = 8
brandSubtitle.TextYAlignment = Enum.TextYAlignment.Top

local buildPill = make("Frame", {
    Name = "BuildPill",
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 248, 0.5, 0),
    Size = UDim2.fromOffset(65, 22),
    BackgroundColor3 = palette.card,
    BorderSizePixel = 0,
}, topbar)
setRole(buildPill, "card")
addCorner(buildPill, 8)
local buildPillText = makeLabel(buildPill, "BUILD " .. APP_VERSION, UDim2.fromScale(1, 1), Enum.Font.GothamBold, "muted", Enum.TextXAlignment.Center)
buildPillText.TextSize = 8

local topActions = make("Frame", {
    Name = "TopActions",
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -12, 0.5, 0),
    Size = UDim2.fromOffset(94, 34),
    BackgroundTransparency = 1,
}, topbar)
addList(topActions, Enum.FillDirection.Horizontal, 7, Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Center)

local minimizeButton = makeTextButton(topActions, "−", UDim2.fromOffset(38, 30), "card", "text", Enum.Font.GothamBold)
minimizeButton.TextSize = 19
local closeButton = makeTextButton(topActions, "×", UDim2.fromOffset(38, 30), "card", "danger", Enum.Font.GothamBold)
closeButton.TextSize = 20

local navBar = make("ScrollingFrame", {
    Name = "Navigation",
    Position = UDim2.new(0, 12, 0, 66),
    Size = UDim2.new(1, -24, 0, 44),
    BackgroundColor3 = palette.panel,
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.X,
    ScrollBarThickness = 2,
    ScrollBarImageColor3 = palette.accent,
    ScrollingDirection = Enum.ScrollingDirection.X,
    ClipsDescendants = true,
}, mainWindow)
setRole(navBar, "panel")
addCorner(navBar, 12)
addPadding(navBar, 6, 5, 6, 5)
local navList = addList(navBar, Enum.FillDirection.Horizontal, 6, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)
navList.HorizontalFlex = Enum.UIFlexAlignment.None

local contentShell = make("Frame", {
    Name = "ContentShell",
    Position = UDim2.new(0, 12, 0, 118),
    Size = UDim2.new(1, -24, 1, -130),
    BackgroundColor3 = palette.background,
    BackgroundTransparency = state.glassMode and 0.12 or 0.02,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, mainWindow)
setRole(contentShell, "content")
addCorner(contentShell, 13)
addStroke(contentShell, "border", 1, 0.35)

local contentHeader = make("Frame", {
    Name = "ContentHeader",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(1, 0, 0, 92),
    BackgroundColor3 = palette.panel,
    BorderSizePixel = 0,
}, contentShell)
setRole(contentHeader, "header")
addPadding(contentHeader, 15, 10, 15, 9)

local pageEyebrow = makeLabel(contentHeader, "INTERFACE MODULE  /  01", UDim2.new(1, 0, 0, 13), Enum.Font.GothamBold, "accent")
pageEyebrow.TextSize = 8

local pageTitle = makeLabel(contentHeader, "Visuals", UDim2.new(1, -8, 0, 28), Enum.Font.GothamBold, "text")
pageTitle.Position = UDim2.new(0, 0, 0, 12)
pageTitle.TextSize = 19

local pageSubtitle = makeLabel(contentHeader, "A curated collection of visual controls", UDim2.new(1, -8, 0, 18), Enum.Font.Gotham, "muted")
pageSubtitle.Position = UDim2.new(0, 0, 0, 39)
pageSubtitle.TextSize = 10

local resultPill = make("Frame", {
    Name = "ResultPill",
    AnchorPoint = Vector2.new(1, 1),
    Position = UDim2.new(1, 0, 1, -2),
    Size = UDim2.fromOffset(70, 22),
    BackgroundColor3 = palette.card,
    BorderSizePixel = 0,
}, contentHeader)
setRole(resultPill, "card")
addCorner(resultPill, 8)
local resultText = makeLabel(resultPill, "0 ITEMS", UDim2.fromScale(1, 1), Enum.Font.GothamBold, "muted", Enum.TextXAlignment.Center)
resultText.TextSize = 8

local searchHolder = make("Frame", {
    Name = "SearchHolder",
    Position = UDim2.new(0, 12, 0, 100),
    Size = UDim2.new(1, -24, 0, 36),
    BackgroundColor3 = palette.card,
    BorderSizePixel = 0,
}, contentShell)
setRole(searchHolder, "card")
addCorner(searchHolder, 10)
addStroke(searchHolder, "border", 1, 0.48)

local searchGlyph = makeLabel(searchHolder, "⌕", UDim2.fromOffset(30, 34), Enum.Font.GothamBold, "accent", Enum.TextXAlignment.Center)
searchGlyph.Position = UDim2.new(0, 2, 0, 0)
searchGlyph.TextSize = 20

local searchBox = make("TextBox", {
    Name = "SearchBox",
    Position = UDim2.new(0, 34, 0, 0),
    Size = UDim2.new(1, -70, 1, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ClearTextOnFocus = false,
    PlaceholderText = "Найти параметр, группу или описание...",
    PlaceholderColor3 = palette.faint,
    Text = "",
    TextColor3 = palette.text,
    TextSize = 11,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
}, searchHolder)
setRole(searchBox, "textInput")

local clearSearch = makeTextButton(searchHolder, "×", UDim2.fromOffset(28, 26), "raised", "muted", Enum.Font.GothamBold)
clearSearch.AnchorPoint = Vector2.new(1, 0.5)
clearSearch.Position = UDim2.new(1, -5, 0.5, 0)
clearSearch.TextSize = 17

local scroll = make("ScrollingFrame", {
    Name = "FeatureScroll",
    Position = UDim2.new(0, 8, 0, 144),
    Size = UDim2.new(1, -16, 1, -152),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = palette.accent,
    ScrollingDirection = Enum.ScrollingDirection.Y,
    ClipsDescendants = true,
}, contentShell)
addPadding(scroll, 4, 4, 4, 12)
local rowList = addList(scroll, Enum.FillDirection.Vertical, 8, Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Top)

local footer = make("Frame", {
    Name = "Footer",
    AnchorPoint = Vector2.new(0.5, 1),
    Position = UDim2.new(0.5, 0, 1, -4),
    Size = UDim2.new(1, -24, 0, 15),
    BackgroundTransparency = 1,
}, mainWindow)

local footerLeft = makeLabel(footer, UI_NOTICE, UDim2.new(0.72, 0, 1, 0), Enum.Font.GothamBold, "faint")
footerLeft.TextSize = 7
local footerRight = makeLabel(footer, "DESIGNED FOR TOUCH", UDim2.new(0.28, 0, 1, 0), Enum.Font.GothamBold, "faint", Enum.TextXAlignment.Right)
footerRight.TextSize = 7

local toastStack = make("Frame", {
    Name = "ToastStack",
    AnchorPoint = Vector2.new(1, 0),
    Position = UDim2.new(1, -16, 0, 16),
    Size = UDim2.fromOffset(300, 300),
    BackgroundTransparency = 1,
    ZIndex = 100,
}, root)
local toastLayout = addList(toastStack, Enum.FillDirection.Vertical, 8, Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Top)

local reopenButton = makeTextButton(root, "A", UDim2.fromOffset(48, 48), "accent", "accentText", Enum.Font.GothamBlack)
reopenButton.Name = "ReopenButton"
reopenButton.AnchorPoint = Vector2.new(1, 1)
reopenButton.Position = UDim2.new(1, -18, 1, -18)
reopenButton.Visible = false
reopenButton.TextSize = 22
addStroke(reopenButton, "accent3", 1, 0.25)

local function applyRole(object, activePalette)
    local role = object:GetAttribute("AquaRole")
    if not role then
        return
    end
    local textRole = object:GetAttribute("AquaTextRole") or role
    local map = {
        background = activePalette.background,
        window = activePalette.window,
        panel = activePalette.panel,
        header = activePalette.panel,
        card = activePalette.card,
        raised = activePalette.raised,
        border = activePalette.border,
        text = activePalette.text,
        muted = activePalette.muted,
        faint = activePalette.faint,
        accent = activePalette.accent,
        accent2 = activePalette.accent2,
        accent3 = activePalette.accent3,
        good = activePalette.good,
        warning = activePalette.warning,
        danger = activePalette.danger,
        glow = activePalette.accent,
        orb = activePalette.accent,
        grid = activePalette.accent,
        particle = activePalette.accent3,
        orbit = activePalette.accent2,
        accentText = activePalette.background,
        content = activePalette.background,
        textInput = activePalette.text,
    }
    local color = map[role]
    if object:IsA("UIStroke") then
        if role == "accent3" then
            object.Color = activePalette.accent3
        elseif role == "orbit" then
            object.Color = activePalette.accent2
        elseif color then
            object.Color = color
        end
    elseif object:IsA("UIGradient") then
        if role == "backgroundGradient" then
            object.Color = ColorSequence.new(activePalette.background, activePalette.panel)
        elseif role == "headerGradient" then
            object.Color = ColorSequence.new(activePalette.panel, activePalette.window)
        elseif role == "orbGradient" then
            object.Color = ColorSequence.new(activePalette.accent, activePalette.accent2)
        end
    elseif object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
        local textColor = map[textRole]
        if textColor then
            object.TextColor3 = textColor
        end
        if object:IsA("TextButton") and color then
            object.BackgroundColor3 = color
        end
        if object:IsA("TextBox") and textRole == "textInput" then
            object.PlaceholderColor3 = activePalette.faint
        end
    elseif object:IsA("Frame") then
        if color then
            object.BackgroundColor3 = color
        end
    end
end

local function applyThemeToTree()
    palette = THEMES[state.themeName] or THEMES.Aquamarine
    for _, object in ipairs(screenGui:GetDescendants()) do
        applyRole(object, palette)
    end
    applyRole(root, palette)
    root.BackgroundTransparency = state.backgroundOpacity
    contentShell.BackgroundTransparency = state.glassMode and 0.12 or 0.02
    windowGlow.Visible = state.glowEffects
    backgroundFx.Visible = true
    gridLayer.Visible = state.gridEffects and (state.backgroundStyle == "Grid" or state.backgroundStyle == "Aurora" or state.backgroundStyle == "Orbit")
    orbitLayer.Visible = state.backgroundStyle == "Orbit"
    orbLayer.Visible = state.backgroundStyle ~= "Midnight" and state.backgroundStyle ~= "Monolith"
    particleLayer.Visible = state.particleEffects and state.backgroundStyle ~= "Monolith"
    for _, dot in ipairs(particles) do
        dot.Visible = state.particleEffects and state.backgroundStyle ~= "Monolith"
    end
    for _, shape in ipairs(orbitShapes) do
        shape.frame.Visible = state.backgroundStyle == "Orbit"
    end
end

setTheme = function(name)
    if not THEMES[name] then
        showToast("Неизвестная палитра", "warning")
        return
    end
    state.themeName = name
    applyThemeToTree()
    for _, button in pairs(tabButtons) do
        if button then
            button.BackgroundColor3 = button:GetAttribute("ActiveTab") and palette.accent or palette.card
            button.TextColor3 = button:GetAttribute("ActiveTab") and palette.background or palette.muted
        end
    end
    showToast("Стиль изменён: " .. name, "accent")
end

setBackgroundStyle = function(styleName)
    local found = false
    for _, style in ipairs(BACKGROUND_STYLES) do
        if style.id == styleName then
            found = true
        end
    end
    if not found then
        return
    end
    state.backgroundStyle = styleName
    applyThemeToTree()
    showToast("Фон: " .. styleName, "accent")
end

showToast = function(message, tone)
    state.toastIndex += 1
    local index = state.toastIndex
    local tones = {
        accent = palette.accent,
        good = palette.good,
        warning = palette.warning,
        danger = palette.danger,
    }
    local accent = tones[tone or "accent"] or palette.accent
    local toast = make("Frame", {
        Name = "Toast" .. tostring(index),
        BackgroundColor3 = palette.panel,
        BackgroundTransparency = 0.04,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(270, 54),
        ZIndex = 101,
    }, toastStack)
    setRole(toast, "panel")
    addCorner(toast, 12)
    addStroke(toast, "border", 1, 0.1)
    local stripe = make("Frame", {
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 3, 1, 0),
        BackgroundColor3 = accent,
        BorderSizePixel = 0,
        ZIndex = 102,
    }, toast)
    addCorner(stripe, 4)
    local toastTitle = makeLabel(toast, "AQUAMARINE / NOTICE", UDim2.new(1, -24, 0, 15), Enum.Font.GothamBold, "accent")
    toastTitle.Position = UDim2.new(0, 14, 0, 7)
    toastTitle.TextSize = 8
    local toastBody = makeLabel(toast, tostring(message), UDim2.new(1, -24, 0, 23), Enum.Font.GothamMedium, "text")
    toastBody.Position = UDim2.new(0, 14, 0, 23)
    toastBody.TextSize = 10
    toastBody.TextWrapped = true
    toast.Position = UDim2.new(1, 32, 0, 0)
    tween(toast, 0.28, { Position = UDim2.new(0, 0, 0, 0) }, Enum.EasingStyle.Back)
    task.delay(2.6, function()
        if toast and toast.Parent then
            tween(toast, 0.2, { Position = UDim2.new(1, 300, 0, 0), BackgroundTransparency = 1 }, Enum.EasingStyle.Quad)
            task.delay(0.22, function()
                if toast and toast.Parent then
                    toast:Destroy()
                end
            end)
        end
    end)
end

local function makeSwitch(parent, initialValue)
    local track = make("Frame", {
        Size = UDim2.fromOffset(42, 24),
        BackgroundColor3 = initialValue and palette.accent2 or palette.raised,
        BorderSizePixel = 0,
    }, parent)
    setRole(track, initialValue and "accent2" or "raised")
    addCorner(track, 12)
    local knob = make("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = initialValue and UDim2.new(1, -20, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
        Size = UDim2.fromOffset(17, 17),
        BackgroundColor3 = Color3.fromRGB(246, 251, 252),
        BorderSizePixel = 0,
    }, track)
    addCorner(knob, 10)
    addStroke(knob, "accent3", 1, 0.7)
    return track, knob
end

local function updateSwitch(track, knob, enabled, immediate)
    track.BackgroundColor3 = enabled and palette.accent2 or palette.raised
    if not immediate then
        tween(knob, 0.2, { Position = enabled and UDim2.new(1, -20, 0.5, 0) or UDim2.new(0, 3, 0.5, 0) }, Enum.EasingStyle.Back)
        tween(track, 0.2, { BackgroundColor3 = enabled and palette.accent2 or palette.raised }, Enum.EasingStyle.Quad)
    else
        knob.Position = enabled and UDim2.new(1, -20, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
    end
end

local function createToggle(parent, item)
    local container = make("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(42, 24),
        BackgroundTransparency = 1,
    }, parent)
    local value = state.values[item.id] == true
    local track, knob = makeSwitch(container, value)
    track.Position = UDim2.new(0, 0, 0, 0)
    local click = make("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        AutoButtonColor = false,
    }, container)
    local function refresh(nextValue)
        updateSwitch(track, knob, nextValue, false)
    end
    item._binding = { refresh = refresh }
    registerPageConnection(click.Activated:Connect(function()
        setFeatureValue(item, not (state.values[item.id] == true), false)
    end))
    return container
end

local function createSlider(parent, item)
    local container = make("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(116, 47),
        BackgroundTransparency = 1,
    }, parent)
    local valueLabel = makeLabel(container, formatNumber(state.values[item.id]), UDim2.new(1, 0, 0, 18), Enum.Font.GothamBold, "accent", Enum.TextXAlignment.Right)
    valueLabel.TextSize = 10
    local track = make("Frame", {
        Position = UDim2.new(0, 0, 0, 27),
        Size = UDim2.new(1, 0, 0, 5),
        BackgroundColor3 = palette.raised,
        BorderSizePixel = 0,
    }, container)
    setRole(track, "raised")
    addCorner(track, 4)
    local fill = make("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = palette.accent,
        BorderSizePixel = 0,
    }, track)
    setRole(fill, "accent")
    addCorner(fill, 4)
    local knob = make("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.fromOffset(13, 13),
        BackgroundColor3 = palette.accent3,
        BorderSizePixel = 0,
        ZIndex = 2,
    }, track)
    addCorner(knob, 8)
    addStroke(knob, "accent", 1, 0.1)
    local function fraction(value)
        local range = math.max(0.0001, item.maximum - item.minimum)
        return clamp((value - item.minimum) / range, 0, 1)
    end
    local function refresh(nextValue)
        local f = fraction(nextValue)
        fill.Size = UDim2.new(f, 0, 1, 0)
        knob.Position = UDim2.new(f, 0, 0.5, 0)
        valueLabel.Text = formatNumber(nextValue)
    end
    local function setFromX(screenX)
        local width = math.max(1, track.AbsoluteSize.X)
        local f = clamp((screenX - track.AbsolutePosition.X) / width, 0, 1)
        local raw = item.minimum + (item.maximum - item.minimum) * f
        local nextValue = item.minimum + round((raw - item.minimum) / item.step) * item.step
        setFeatureValue(item, nextValue, true)
        refresh(state.values[item.id])
    end
    item._binding = { refresh = refresh }
    local hit = make("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 14, 1, 16),
        Position = UDim2.new(0, -7, 0, -8),
        Text = "",
        AutoButtonColor = false,
    }, container)
    registerPageConnection(hit.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliderDrag = { item = item, update = setFromX }
            setFromX(input.Position.X)
        end
    end))
    refresh(state.values[item.id])
    return container
end

local function createDropdown(parent, item)
    local value = state.values[item.id]
    local button = makeTextButton(parent, tostring(value) .. "  ▾", UDim2.fromOffset(110, 32), "raised", "text", Enum.Font.GothamMedium)
    button.AnchorPoint = Vector2.new(1, 0.5)
    button.Position = UDim2.new(1, -10, 0.5, 0)
    button.TextSize = 9
    button.TextTruncate = Enum.TextTruncate.AtEnd
    local function refresh(nextValue)
        button.Text = tostring(nextValue) .. "  ▾"
    end
    item._binding = { refresh = refresh }
    registerPageConnection(button.Activated:Connect(function()
        local popup = make("Frame", {
            Name = "OptionPopup",
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -10, 0, 0),
            Size = UDim2.fromOffset(150, math.min(176, #item.options * 33 + 12)),
            BackgroundColor3 = palette.window,
            BorderSizePixel = 0,
            ZIndex = 45,
        }, root)
        setRole(popup, "window")
        addCorner(popup, 11)
        addStroke(popup, "accent", 1, 0.2)
        addPadding(popup, 6, 6, 6, 6)
        local list = addList(popup, Enum.FillDirection.Vertical, 4, Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Top)
        local pointer = UserInputService:GetMouseLocation()
        if UserInputService.TouchEnabled then
            local absolute = button.AbsolutePosition
            popup.Position = UDim2.fromOffset(clamp(absolute.X + button.AbsoluteSize.X - 150, 6, math.max(6, Camera.ViewportSize.X - 156)), clamp(absolute.Y + button.AbsoluteSize.Y, 8, math.max(8, Camera.ViewportSize.Y - popup.AbsoluteSize.Y - 8)))
            popup.AnchorPoint = Vector2.new(0, 0)
        else
            popup.Position = UDim2.fromOffset(clamp(pointer.X - 150, 6, math.max(6, Camera.ViewportSize.X - 156)), clamp(pointer.Y + 8, 8, math.max(8, Camera.ViewportSize.Y - popup.AbsoluteSize.Y - 8)))
            popup.AnchorPoint = Vector2.new(0, 0)
        end
        for optionIndex, option in ipairs(item.options) do
            local optionButton = makeTextButton(popup, tostring(option), UDim2.new(1, 0, 0, 29), option == value and "accent" or "card", option == value and "accentText" or "text", Enum.Font.GothamMedium)
            optionButton.LayoutOrder = optionIndex
            optionButton.TextSize = 10
            optionButton.ZIndex = 47
            registerPageConnection(optionButton.Activated:Connect(function()
                setFeatureValue(item, option, false)
                if popup and popup.Parent then
                    popup:Destroy()
                end
            end))
        end
        task.delay(5, function()
            if popup and popup.Parent then
                popup:Destroy()
            end
        end)
    end))
    return button
end

local function createAction(parent, item)
    local button = makeTextButton(parent, "OPEN  ↗", UDim2.fromOffset(90, 32), "raised", "accent", Enum.Font.GothamBold)
    button.AnchorPoint = Vector2.new(1, 0.5)
    button.Position = UDim2.new(1, -10, 0.5, 0)
    button.TextSize = 8
    registerPageConnection(button.Activated:Connect(function()
        state.values[item.id] = (state.values[item.id] or 0) + 1
        showToast("Демо-действие: " .. item.title, "accent")
    end))
    return button
end

local function createFeatureRow(item, order)
    local height = state.compactRows and 63 or 76
    local row = make("Frame", {
        Name = "Feature_" .. item.id,
        Size = UDim2.new(1, -2, 0, height),
        BackgroundColor3 = palette.card,
        BackgroundTransparency = 0.02,
        BorderSizePixel = 0,
        LayoutOrder = order,
        ClipsDescendants = true,
    }, scroll)
    setRole(row, "card")
    addCorner(row, math.max(7, state.cornerSize - 3))
    local outline = addStroke(row, "border", 1, 0.45)
    local accentLine = make("Frame", {
        Name = "AccentLine",
        Position = UDim2.new(0, 0, 0, 10),
        Size = UDim2.new(0, 2, 1, -20),
        BackgroundColor3 = palette.accent,
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
    }, row)
    setRole(accentLine, "accent")
    addCorner(accentLine, 2)
    local title = makeLabel(row, item.title, UDim2.new(1, -155, 0, 22), Enum.Font.GothamBold, "text")
    title.Position = UDim2.new(0, 13, 0, 9)
    title.TextSize = 11
    title.TextTruncate = Enum.TextTruncate.AtEnd
    local badge = makeLabel(row, string.upper(item.badge), UDim2.new(0, 65, 0, 13), Enum.Font.GothamBold, "accent")
    badge.Position = UDim2.new(0, 13, 1, -19)
    badge.TextSize = 7
    badge.Visible = state.showTinyBadges
    local description = makeLabel(row, item.description, UDim2.new(1, -155, 0, state.compactRows and 13 or 28), Enum.Font.Gotham, "muted")
    description.Position = UDim2.new(0, 13, 0, 31)
    description.TextSize = 9
    description.TextWrapped = true
    description.TextYAlignment = Enum.TextYAlignment.Top
    description.Visible = state.showDescriptions and not state.compactRows
    local detail = makeLabel(row, item.detail, UDim2.new(1, -155, 0, 12), Enum.Font.Gotham, "faint")
    detail.Position = UDim2.new(0, 13, 1, -14)
    detail.TextSize = 7
    detail.TextTruncate = Enum.TextTruncate.AtEnd
    detail.Visible = state.compactRows
    if item.kind == "toggle" then
        createToggle(row, item)
    elseif item.kind == "slider" then
        createSlider(row, item)
    elseif item.kind == "dropdown" then
        createDropdown(row, item)
    else
        createAction(row, item)
    end
    local infoButton = makeTextButton(row, "i", UDim2.fromOffset(18, 18), "raised", "muted", Enum.Font.GothamBold)
    infoButton.Position = UDim2.new(1, -8, 0, 7)
    infoButton.AnchorPoint = Vector2.new(1, 0)
    infoButton.TextSize = 9
    infoButton.BackgroundTransparency = 0.15
    infoButton.ZIndex = 3
    registerPageConnection(infoButton.Activated:Connect(function()
        showToast(item.title .. " · " .. item.detail, "accent")
    end))
    registerPageConnection(row.MouseEnter:Connect(function()
        if not UserInputService.TouchEnabled then
            tween(row, 0.16, { BackgroundColor3 = palette.raised }, Enum.EasingStyle.Quad)
            outline.Transparency = 0.1
            accentLine.BackgroundTransparency = 0
        end
    end))
    registerPageConnection(row.MouseLeave:Connect(function()
        tween(row, 0.18, { BackgroundColor3 = palette.card }, Enum.EasingStyle.Quad)
        outline.Transparency = 0.45
        accentLine.BackgroundTransparency = 0.35
    end))
    table.insert(currentRows, row)
    task.defer(function()
        if row and row.Parent then
            row.BackgroundTransparency = 0.18
            tween(row, 0.24, { BackgroundTransparency = 0.02 }, Enum.EasingStyle.Quad)
        end
    end)
    return row
end

local function clearRows()
    for _, connection in ipairs(pageConnections) do
        safeDisconnect(connection)
    end
    table.clear(pageConnections)
    for _, row in ipairs(currentRows) do
        if row and row.Parent then
            row:Destroy()
        end
    end
    table.clear(currentRows)
end

local function setActiveTabAppearance(activeId)
    for tabId, button in pairs(tabButtons) do
        if button and button.Parent then
            local active = tabId == activeId
            button:SetAttribute("ActiveTab", active)
            button.BackgroundColor3 = active and palette.accent or palette.card
            button.TextColor3 = active and palette.background or palette.muted
            local stroke = button:FindFirstChildOfClass("UIStroke")
            if stroke then
                stroke.Transparency = active and 0.55 or 1
            end
        end
    end
end

local function createTabButtons()
    for index, tab in ipairs(TABS) do
        local button = makeTextButton(navBar, tab.glyph .. "  " .. tab.shortTitle, UDim2.fromOffset(96, 32), "card", "muted", Enum.Font.GothamBold)
        button.Name = "Tab_" .. tab.id
        button.LayoutOrder = index
        button.TextSize = 8
        button:SetAttribute("TabId", tab.id)
        addStroke(button, "border", 1, 0.78)
        tabButtons[tab.id] = button
        registerConnection(button.Activated:Connect(function()
            state.activeTab = tab.id
            searchBox.Text = ""
            state.searchQuery = ""
            renderTab(tab.id)
        end))
    end
end

local function createThemeShowcase(parent)
    local showcase = makePanel(parent, UDim2.new(1, -2, 0, 190), "panel", 12)
    showcase.LayoutOrder = -2
    addPadding(showcase, 10, 10, 10, 10)
    local title = makeLabel(showcase, "COLOR STUDY  /  08 PALETTES", UDim2.new(1, 0, 0, 16), Enum.Font.GothamBold, "accent")
    title.TextSize = 8
    local subtitle = makeLabel(showcase, "Выбери оттенки, которые определяют характер всего меню.", UDim2.new(1, 0, 0, 18), Enum.Font.Gotham, "muted")
    subtitle.Position = UDim2.new(0, 0, 0, 18)
    subtitle.TextSize = 9
    local colorScroll = make("ScrollingFrame", {
        Position = UDim2.new(0, 0, 0, 42),
        Size = UDim2.new(1, 0, 0, 61),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = palette.accent,
        ScrollingDirection = Enum.ScrollingDirection.X,
    }, showcase)
    local colorList = addList(colorScroll, Enum.FillDirection.Horizontal, 8, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)
    for index, name in ipairs({ "Aquamarine", "Violet", "Ember", "Rose", "Arctic", "Emerald", "Gold", "Mono" }) do
        local theme = THEMES[name]
        local card = make("TextButton", {
            Name = "Theme_" .. name,
            AutoButtonColor = false,
            Size = UDim2.fromOffset(95, 52),
            BackgroundColor3 = theme.card,
            BorderSizePixel = 0,
            Text = "",
            LayoutOrder = index,
        }, colorScroll)
        addCorner(card, 9)
        local bar = make("Frame", {
            Position = UDim2.new(0, 7, 0, 7),
            Size = UDim2.new(1, -14, 0, 6),
            BackgroundColor3 = theme.accent,
            BorderSizePixel = 0,
        }, card)
        addCorner(bar, 4)
        local dot1 = make("Frame", { Position = UDim2.new(0, 7, 0, 20), Size = UDim2.fromOffset(9, 9), BackgroundColor3 = theme.accent2, BorderSizePixel = 0 }, card)
        addCorner(dot1, 5)
        local dot2 = make("Frame", { Position = UDim2.new(0, 20, 0, 20), Size = UDim2.fromOffset(9, 9), BackgroundColor3 = theme.accent3, BorderSizePixel = 0 }, card)
        addCorner(dot2, 5)
        local text = makeLabel(card, name, UDim2.new(1, -12, 0, 14), Enum.Font.GothamBold, "text")
        text.Position = UDim2.new(0, 7, 1, -17)
        text.TextColor3 = theme.text
        text.TextSize = 8
        text.TextTruncate = Enum.TextTruncate.AtEnd
        local selected = make("Frame", {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -5, 0, 5),
            Size = UDim2.fromOffset(8, 8),
            BackgroundColor3 = theme.accent3,
            BackgroundTransparency = state.themeName == name and 0 or 1,
            BorderSizePixel = 0,
        }, card)
        addCorner(selected, 5)
        registerPageConnection(card.Activated:Connect(function()
            state.themeName = name
            setTheme(name)
            for _, child in ipairs(colorScroll:GetChildren()) do
                if child:IsA("TextButton") then
                    local marker = child:FindFirstChild("SelectionMark")
                    if marker then
                        local expected = child.Name == "Theme_" .. name
                        marker.BackgroundTransparency = expected and 0 or 1
                    end
                end
            end
        end))
        selected.Name = "SelectionMark"
    end
    local styleLabel = makeLabel(showcase, "BACKGROUND", UDim2.new(0, 100, 0, 13), Enum.Font.GothamBold, "muted")
    styleLabel.Position = UDim2.new(0, 0, 0, 111)
    styleLabel.TextSize = 8
    local styleScroll = make("ScrollingFrame", {
        Position = UDim2.new(0, 0, 0, 128),
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = palette.accent,
        ScrollingDirection = Enum.ScrollingDirection.X,
    }, showcase)
    addList(styleScroll, Enum.FillDirection.Horizontal, 6, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)
    for index, style in ipairs(BACKGROUND_STYLES) do
        local button = makeTextButton(styleScroll, style.title, UDim2.fromOffset(84, 28), state.backgroundStyle == style.id and "accent" or "card", state.backgroundStyle == style.id and "accentText" or "muted", Enum.Font.GothamBold)
        button.LayoutOrder = index
        button.TextSize = 8
        registerPageConnection(button.Activated:Connect(function()
            setBackgroundStyle(style.id)
            renderTab("themes")
        end))
    end
    return showcase
end

local function createProfileShowcase(parent)
    local showcase = makePanel(parent, UDim2.new(1, -2, 0, 142), "panel", 12)
    showcase.LayoutOrder = -2
    addPadding(showcase, 10, 10, 10, 10)
    local title = makeLabel(showcase, "LOCAL PROFILES", UDim2.new(1, 0, 0, 16), Enum.Font.GothamBold, "accent")
    title.TextSize = 8
    local subtitle = makeLabel(showcase, "Профили меняют только оформление и значения этого прототипа.", UDim2.new(1, 0, 0, 18), Enum.Font.Gotham, "muted")
    subtitle.Position = UDim2.new(0, 0, 0, 18)
    subtitle.TextSize = 9
    local profileList = make("Frame", {
        Position = UDim2.new(0, 0, 0, 43),
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundTransparency = 1,
    }, showcase)
    addList(profileList, Enum.FillDirection.Horizontal, 6, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)
    local profiles = {
        { name = "Aquamarine Night", theme = "Aquamarine", bg = "Aurora", speed = 1, scale = 1 },
        { name = "Violet Dream", theme = "Violet", bg = "Prism", speed = 0.8, scale = 0.96 },
        { name = "Arctic Pulse", theme = "Arctic", bg = "Grid", speed = 1.15, scale = 1.02 },
        { name = "Pure Mono", theme = "Mono", bg = "Monolith", speed = 0.7, scale = 1 },
    }
    for index, profile in ipairs(profiles) do
        local button = makeTextButton(profileList, profile.name, UDim2.fromOffset(116, 30), "card", "text", Enum.Font.GothamBold)
        button.LayoutOrder = index
        button.TextSize = 8
        registerPageConnection(button.Activated:Connect(function()
            state.profileName = profile.name
            state.animationSpeed = profile.speed
            state.uiScale = profile.scale
            setTheme(profile.theme)
            setBackgroundStyle(profile.bg)
            refreshResponsiveLayout()
            showToast("Профиль применён: " .. profile.name, "good")
        end))
    end
    local resetButton = makeTextButton(showcase, "RESET UI VALUES", UDim2.new(1, 0, 0, 28), "raised", "warning", Enum.Font.GothamBold)
    resetButton.Position = UDim2.new(0, 0, 1, -34)
    resetButton.TextSize = 8
    registerPageConnection(resetButton.Activated:Connect(function()
        for _, feature in ipairs(FEATURES) do
            state.values[feature.id] = feature.defaultValue
        end
        state.themeName = "Aquamarine"
        state.backgroundStyle = "Aurora"
        state.animationSpeed = 1
        state.uiScale = 1
        state.cornerSize = 14
        state.backgroundOpacity = 0.16
        state.particleEffects = true
        state.gridEffects = true
        state.glowEffects = true
        state.reducedMotion = false
        state.compactRows = false
        state.showDescriptions = true
        state.showTinyBadges = true
        state.glassMode = true
        applyThemeToTree()
        refreshResponsiveLayout()
        renderTab("config")
        showToast("Локальные значения сброшены", "good")
    end))
    return showcase
end

local function createStyleControls(parent)
    local panel = makePanel(parent, UDim2.new(1, -2, 0, 220), "panel", 12)
    panel.LayoutOrder = -1
    addPadding(panel, 10, 10, 10, 10)
    local title = makeLabel(panel, "LIVE STYLE CONTROLS", UDim2.new(1, 0, 0, 16), Enum.Font.GothamBold, "accent")
    title.TextSize = 8
    local description = makeLabel(panel, "Изменения применяются сразу и остаются в текущей сессии.", UDim2.new(1, 0, 0, 16), Enum.Font.Gotham, "muted")
    description.Position = UDim2.new(0, 0, 0, 17)
    description.TextSize = 9
    local function addToggleLine(y, name, hint, getter, setter)
        local line = make("Frame", {
            Position = UDim2.new(0, 0, 0, y),
            Size = UDim2.new(1, 0, 0, 29),
            BackgroundTransparency = 1,
        }, panel)
        local label = makeLabel(line, name, UDim2.new(0.64, 0, 1, 0), Enum.Font.GothamMedium, "text")
        label.TextSize = 10
        local hintLabel = makeLabel(line, hint, UDim2.new(0.64, 0, 0, 12), Enum.Font.Gotham, "faint")
        hintLabel.Position = UDim2.new(0, 0, 1, -11)
        hintLabel.TextSize = 7
        local track, knob = makeSwitch(line, getter())
        track.AnchorPoint = Vector2.new(1, 0.5)
        track.Position = UDim2.new(1, -2, 0.5, 0)
        local hit = make("TextButton", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", AutoButtonColor = false }, track)
        registerPageConnection(hit.Activated:Connect(function()
            local value = not getter()
            setter(value)
            updateSwitch(track, knob, value, false)
            applyThemeToTree()
            renderTab(state.activeTab)
        end))
    end
    addToggleLine(39, "Floating particles", "Мягкие движущиеся огни", function() return state.particleEffects end, function(value) state.particleEffects = value end)
    addToggleLine(70, "Technical grid", "Тонкие контуры на фоне", function() return state.gridEffects end, function(value) state.gridEffects = value end)
    addToggleLine(101, "Accent glow", "Световая линия заголовка", function() return state.glowEffects end, function(value) state.glowEffects = value end)
    addToggleLine(132, "Reduced motion", "Меньше движения и переходов", function() return state.reducedMotion end, function(value) state.reducedMotion = value end)
    addToggleLine(163, "Glass surface", "Полупрозрачная подложка", function() return state.glassMode end, function(value) state.glassMode = value end)
    local cornersLabel = makeLabel(panel, "CORNER RADIUS", UDim2.new(0.4, 0, 0, 13), Enum.Font.GothamBold, "muted")
    cornersLabel.Position = UDim2.new(0, 0, 1, -21)
    cornersLabel.TextSize = 8
    local cornersButton = makeTextButton(panel, tostring(state.cornerSize) .. " px  ↻", UDim2.fromOffset(95, 25), "raised", "accent", Enum.Font.GothamBold)
    cornersButton.AnchorPoint = Vector2.new(1, 1)
    cornersButton.Position = UDim2.new(1, 0, 1, -1)
    cornersButton.TextSize = 8
    registerPageConnection(cornersButton.Activated:Connect(function()
        local options = { 8, 10, 12, 14, 18, 22 }
        local current = 1
        for index, option in ipairs(options) do
            if option == state.cornerSize then
                current = index
            end
        end
        current = current % #options + 1
        state.cornerSize = options[current]
        cornersButton.Text = tostring(state.cornerSize) .. " px  ↻"
        for _, object in ipairs(screenGui:GetDescendants()) do
            if object:IsA("UICorner") then
                object.CornerRadius = UDim.new(0, state.cornerSize)
            end
        end
        showToast("Радиус углов обновлён", "accent")
    end))
    return panel
end

local function createRangeSetting(parent, titleText, y, minValue, maxValue, currentValue, setter, suffix)
    local line = make("Frame", {
        Position = UDim2.new(0, 0, 0, y),
        Size = UDim2.new(1, 0, 0, 43),
        BackgroundTransparency = 1,
    }, parent)
    local title = makeLabel(line, titleText, UDim2.new(0.65, 0, 0, 17), Enum.Font.GothamMedium, "text")
    title.TextSize = 9
    local valueText = makeLabel(line, tostring(currentValue) .. (suffix or ""), UDim2.new(0.35, 0, 0, 17), Enum.Font.GothamBold, "accent", Enum.TextXAlignment.Right)
    valueText.TextSize = 9
    local track = make("Frame", {
        Position = UDim2.new(0, 0, 0, 25),
        Size = UDim2.new(1, 0, 0, 5),
        BackgroundColor3 = palette.raised,
        BorderSizePixel = 0,
    }, line)
    setRole(track, "raised")
    addCorner(track, 5)
    local fill = make("Frame", {
        Size = UDim2.new((currentValue - minValue) / (maxValue - minValue), 0, 1, 0),
        BackgroundColor3 = palette.accent,
        BorderSizePixel = 0,
    }, track)
    setRole(fill, "accent")
    addCorner(fill, 5)
    local function update(x)
        local fraction = clamp((x - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
        local value = round(minValue + (maxValue - minValue) * fraction)
        setter(value)
        valueText.Text = tostring(value) .. (suffix or "")
        fill.Size = UDim2.new(fraction, 0, 1, 0)
    end
    registerPageConnection(track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliderDrag = { update = update }
            update(input.Position.X)
        end
    end))
    return line
end

local function createConfigControls(parent)
    local panel = makePanel(parent, UDim2.new(1, -2, 0, 198), "panel", 12)
    panel.LayoutOrder = -1
    addPadding(panel, 10, 10, 10, 10)
    local title = makeLabel(panel, "DISPLAY TUNING", UDim2.new(1, 0, 0, 16), Enum.Font.GothamBold, "accent")
    title.TextSize = 8
    local sub = makeLabel(panel, "Подстрой размер и темп интерфейса под экран.", UDim2.new(1, 0, 0, 16), Enum.Font.Gotham, "muted")
    sub.Position = UDim2.new(0, 0, 0, 17)
    sub.TextSize = 9
    createRangeSetting(panel, "UI scale", 38, 80, 110, round(state.uiScale * 100), function(value)
        state.uiScale = value / 100
        refreshResponsiveLayout()
    end, "%")
    createRangeSetting(panel, "Animation pace", 83, 50, 150, round(state.animationSpeed * 100), function(value)
        state.animationSpeed = value / 100
    end, "%")
    createRangeSetting(panel, "Background opacity", 128, 0, 45, round(state.backgroundOpacity * 100), function(value)
        state.backgroundOpacity = value / 100
        root.BackgroundTransparency = state.backgroundOpacity
    end, "%")
    return panel
end

local function updateFeatureCount()
    local count = findFeatureCount(state.activeTab, state.searchQuery)
    resultText.Text = tostring(count) .. " ITEMS"
end

renderTab = function(tabId)
    state.activeTab = tabId or state.activeTab
    local tab = findTab(state.activeTab)
    setActiveTabAppearance(state.activeTab)
    pageTitle.Text = tab.title
    pageSubtitle.Text = tab.subtitle
    pageEyebrow.Text = "INTERFACE MODULE  /  " .. string.format("%02d", table.find(TABS, tab) or 1)
    clearRows()
    if state.activeTab == "themes" then
        createThemeShowcase(scroll)
        createStyleControls(scroll)
    elseif state.activeTab == "config" then
        createProfileShowcase(scroll)
        createConfigControls(scroll)
    end
    local order = 0
    for _, item in ipairs(FEATURES) do
        if item.tab == state.activeTab and rowMatches(item, state.searchQuery) then
            order += 1
            createFeatureRow(item, order)
        end
    end
    if order == 0 then
        local empty = makePanel(scroll, UDim2.new(1, -2, 0, 108), "panel", 12)
        empty.LayoutOrder = 99
        local emptyTitle = makeLabel(empty, "NO MATCHES", UDim2.new(1, -24, 0, 24), Enum.Font.GothamBold, "text", Enum.TextXAlignment.Center)
        emptyTitle.AnchorPoint = Vector2.new(0.5, 0)
        emptyTitle.Position = UDim2.new(0.5, 0, 0, 22)
        emptyTitle.TextSize = 12
        local emptySubtitle = makeLabel(empty, "Попробуй другой запрос или очисти поиск.", UDim2.new(1, -24, 0, 20), Enum.Font.Gotham, "muted", Enum.TextXAlignment.Center)
        emptySubtitle.AnchorPoint = Vector2.new(0.5, 0)
        emptySubtitle.Position = UDim2.new(0.5, 0, 0, 50)
        emptySubtitle.TextSize = 9
    end
    updateFeatureCount()
    scroll.CanvasPosition = Vector2.new(0, 0)
    task.defer(function()
        if scroll and scroll.Parent then
            scroll.CanvasSize = UDim2.new(0, 0, 0, rowList.AbsoluteContentSize.Y + 16)
        end
    end)
end

refreshResponsiveLayout = function()
    Camera = workspace.CurrentCamera or Camera
    local viewport = Camera and Camera.ViewportSize or Vector2.new(390, 844)
    local availableWidth = math.max(300, viewport.X - 18)
    local availableHeight = math.max(420, viewport.Y - 28)
    local width = clamp(availableWidth * state.uiScale, 320, 960)
    local height = clamp(availableHeight * 0.9, 440, 790)
    if viewport.X < 390 then
        width = math.max(302, viewport.X - 12)
    end
    if viewport.Y < 520 then
        height = math.max(390, viewport.Y - 12)
    end
    mainWindow.Size = UDim2.fromOffset(width, height)
    local isNarrow = viewport.X < 560
    buildPill.Visible = not isNarrow
    brandSubtitle.Visible = not (viewport.X < 365)
    minimizeButton.Size = UDim2.fromOffset(isNarrow and 32 or 38, 30)
    closeButton.Size = UDim2.fromOffset(isNarrow and 32 or 38, 30)
    topActions.Size = UDim2.fromOffset(isNarrow and 72 or 94, 34)
    brandTitle.Size = UDim2.new(0, isNarrow and 124 or 160, 0, 22)
    brandTitle.TextSize = isNarrow and 12 or 14
    brandMark.Position = UDim2.new(0, 10, 0, 12)
    brandTitle.Position = UDim2.new(0, 50, 0, 9)
    brandSubtitle.Position = UDim2.new(0, 51, 0, 31)
    local smallNav = width < 540
    for _, button in pairs(tabButtons) do
        button.Size = UDim2.fromOffset(smallNav and 83 or 96, 32)
    end
    searchBox.PlaceholderText = smallNav and "Поиск..." or "Найти параметр, группу или описание..."
    pageTitle.TextSize = smallNav and 17 or 19
    pageSubtitle.TextSize = smallNav and 8 or 10
    footerLeft.TextSize = smallNav and 6 or 7
    footerRight.TextSize = smallNav and 6 or 7
    windowScale.Scale = 0.94
    tween(windowScale, 0.24, { Scale = 1 }, Enum.EasingStyle.Back)
end

local function setMinimized(enabled)
    state.minimized = enabled
    contentShell.Visible = not enabled
    navBar.Visible = not enabled
    footer.Visible = not enabled
    if enabled then
        tween(mainWindow, 0.24, { Size = UDim2.new(mainWindow.Size.X.Scale, mainWindow.Size.X.Offset, 0, 58) }, Enum.EasingStyle.Quint)
        minimizeButton.Text = "+"
    else
        minimizeButton.Text = "−"
        refreshResponsiveLayout()
    end
end

local function hideMenu()
    state.visible = false
    tween(windowScale, 0.16, { Scale = 0.9 }, Enum.EasingStyle.Quad)
    task.delay(0.12, function()
        if mainWindow and mainWindow.Parent then
            mainWindow.Visible = false
            reopenButton.Visible = true
            reopenButton.Size = UDim2.fromOffset(0, 0)
            tween(reopenButton, 0.22, { Size = UDim2.fromOffset(48, 48) }, Enum.EasingStyle.Back)
        end
    end)
end

local function showMenu()
    state.visible = true
    mainWindow.Visible = true
    reopenButton.Visible = false
    refreshResponsiveLayout()
    windowScale.Scale = 0.88
    tween(windowScale, 0.26, { Scale = 1 }, Enum.EasingStyle.Back)
end

local function resetWindowPosition()
    mainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
    mainWindow.Position = UDim2.fromScale(0.5, 0.5)
end

createTabButtons()
applyThemeToTree()
renderTab(state.activeTab)
refreshResponsiveLayout()

registerConnection(searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    state.searchQuery = searchBox.Text
    renderTab(state.activeTab)
end))

registerConnection(clearSearch.Activated:Connect(function()
    searchBox.Text = ""
    state.searchQuery = ""
    renderTab(state.activeTab)
end))

registerConnection(minimizeButton.Activated:Connect(function()
    setMinimized(not state.minimized)
end))

registerConnection(closeButton.Activated:Connect(function()
    hideMenu()
end))

registerConnection(reopenButton.Activated:Connect(function()
    showMenu()
end))

registerConnection(UserInputService.InputChanged:Connect(function(input)
    if sliderDrag then
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            sliderDrag.update(input.Position.X)
        end
    end
    if windowDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - windowDragOrigin
        mainWindow.Position = UDim2.new(windowPositionOrigin.X.Scale, windowPositionOrigin.X.Offset + delta.X, windowPositionOrigin.Y.Scale, windowPositionOrigin.Y.Offset + delta.Y)
    end
end))

registerConnection(UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        sliderDrag = nil
        windowDrag = nil
    end
end))

registerConnection(topbar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        windowDrag = true
        windowDragOrigin = input.Position
        windowPositionOrigin = mainWindow.Position
    end
end))

registerConnection(root.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        local viewport = Camera and Camera.ViewportSize or Vector2.new(390, 844)
        local px = input.Position.X / math.max(1, viewport.X)
        local py = input.Position.Y / math.max(1, viewport.Y)
        if state.backgroundStyle == "Aurora" or state.backgroundStyle == "Prism" then
            for index, orb in ipairs(orbs) do
                local direction = index % 2 == 0 and -1 or 1
                tween(orb, 0.7, {
                    Position = UDim2.fromScale(orbSpecs[index].x + (px - 0.5) * 0.04 * direction, orbSpecs[index].y + (py - 0.5) * 0.04 * direction),
                }, Enum.EasingStyle.Sine)
            end
        end
    end
end))

if Camera then
    registerConnection(Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        refreshResponsiveLayout()
    end))
end

for index, orb in ipairs(orbs) do
    if not state.reducedMotion then
        task.spawn(function()
            local direction = index % 2 == 0 and 1 or -1
            while orb and orb.Parent and screenGui.Parent do
                local spec = orbSpecs[index]
                tween(orb, random:NextNumber(5.0, 8.0), {
                    Position = UDim2.fromScale(spec.x + random:NextNumber(-0.07, 0.07), spec.y + random:NextNumber(-0.08, 0.08)),
                    Rotation = orb.Rotation + direction * random:NextNumber(18, 44),
                }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(random:NextNumber(5.0, 8.0))
            end
        end)
    end
end

for index, dot in ipairs(particles) do
    task.spawn(function()
        while dot and dot.Parent and screenGui.Parent do
            if state.particleEffects and not state.reducedMotion then
                local duration = random:NextNumber(3.0, 6.5)
                tween(dot, duration, {
                    Position = UDim2.fromScale(random:NextNumber(0.02, 0.98), random:NextNumber(0.03, 0.97)),
                    BackgroundTransparency = random:NextNumber(0.38, 0.82),
                }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(duration)
            else
                task.wait(1)
            end
        end
    end)
end

for index, shape in ipairs(orbitShapes) do
    task.spawn(function()
        while shape.frame and shape.frame.Parent and screenGui.Parent do
            if state.backgroundStyle == "Orbit" and not state.reducedMotion then
                tween(shape.frame, 12 + index * 2, { Rotation = shape.frame.Rotation + (index % 2 == 0 and -360 or 360) }, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                task.wait(12 + index * 2)
            else
                task.wait(1)
            end
        end
    end)
end

registerConnection(RunService.RenderStepped:Connect(function(deltaTime)
    if not screenGui.Parent then
        return
    end
    if state.glowEffects and not state.reducedMotion then
        local pulse = (math.sin(os.clock() * 1.1) + 1) * 0.5
        windowGlow.BackgroundTransparency = 0.76 - pulse * 0.22
    end
end))

registerConnection(screenGui.Destroying:Connect(function()
    for _, connection in ipairs(connections) do
        safeDisconnect(connection)
    end
    table.clear(connections)
end))

showToast("Aquamarine Creative Interface готов", "good")
