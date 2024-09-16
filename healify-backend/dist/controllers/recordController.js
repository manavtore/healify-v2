"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createRecord = void 0;
const database_1 = __importDefault(require("../config/database"));
const createRecord = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const record = yield database_1.default.record.create({
            data: {
                title: req.body.title,
                date: req.body.date,
                symptoms: req.body.symptoms,
                diagnosis: req.body.diagnosis,
                treatment: req.body.treatment,
                userId: req.body.userId,
            },
        });
        res.status(201).json(record);
    }
    catch (error) {
        res.status(400).json({ error: "Failed to create record" });
    }
});
exports.createRecord = createRecord;
