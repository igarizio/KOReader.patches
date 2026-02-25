--[[ --
Patch for ProjectTitle to use page counts from opened books. 
--]] --

local userpatch = require("userpatch")
local DocSettings = require("docsettings")
local logger = require("logger")

local function patchProjectTitlePageCount(plugin)
    logger.info("Project: Title patch initialized.")

    local BookInfoManager = require("bookinfomanager")
    local original_getBookInfo = BookInfoManager.getBookInfo

    function BookInfoManager:getBookInfo(filepath, ...)
        local pt_book_info = original_getBookInfo(self, filepath, ...)
        local sdr_book_info = DocSettings:open(filepath)

        if pt_book_info and sdr_book_info then
            sdr_pages = sdr_book_info:readSetting("doc_pages")
            if sdr_pages then
                pt_book_info.pages = sdr_pages
            end
        end

        return pt_book_info
    end
end

local function patchProjectTitleBarLength(plugin)
    local ptutil = require("ptutil")
    ptutil.list_defaults.progress_bar_pages_per_pixel = 6 -- This is a ratio.
end

userpatch.registerPatchPluginFunc("coverbrowser", patchProjectTitleBarLength)
userpatch.registerPatchPluginFunc("coverbrowser", patchProjectTitlePageCount)
