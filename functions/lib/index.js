"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.onEmergencyReportCreate = exports.onAlertCleanup = exports.onAlertCreate = exports.onUserProfileCreate = exports.onUserCreate = exports.registerToken = exports.setUserRole = exports.importCampusData = void 0;
const admin = __importStar(require("firebase-admin"));
const importCampusData_1 = require("./admin/importCampusData");
Object.defineProperty(exports, "importCampusData", { enumerable: true, get: function () { return importCampusData_1.importCampusData; } });
const setUserRole_1 = require("./admin/setUserRole");
Object.defineProperty(exports, "setUserRole", { enumerable: true, get: function () { return setUserRole_1.setUserRole; } });
const onUserCreate_1 = require("./auth/onUserCreate");
Object.defineProperty(exports, "onUserCreate", { enumerable: true, get: function () { return onUserCreate_1.onUserCreate; } });
const onUserProfileCreate_1 = require("./auth/onUserProfileCreate");
Object.defineProperty(exports, "onUserProfileCreate", { enumerable: true, get: function () { return onUserProfileCreate_1.onUserProfileCreate; } });
const registerToken_1 = require("./fcm/registerToken");
Object.defineProperty(exports, "registerToken", { enumerable: true, get: function () { return registerToken_1.registerToken; } });
const onAlertCreate_1 = require("./alerts/onAlertCreate");
Object.defineProperty(exports, "onAlertCreate", { enumerable: true, get: function () { return onAlertCreate_1.onAlertCreate; } });
const onAlertCleanup_1 = require("./alerts/onAlertCleanup");
Object.defineProperty(exports, "onAlertCleanup", { enumerable: true, get: function () { return onAlertCleanup_1.onAlertCleanup; } });
const onReportCreate_1 = require("./emergency/onReportCreate");
Object.defineProperty(exports, "onEmergencyReportCreate", { enumerable: true, get: function () { return onReportCreate_1.onEmergencyReportCreate; } });
admin.initializeApp();
//# sourceMappingURL=index.js.map