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
exports.generateDownloadPresignedUrl = exports.generateUploadPresignedUrl = exports.createFile = void 0;
const database_1 = __importDefault(require("../config/database"));
const s3Service_1 = require("../services/s3Service");
const createFile = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const file = yield database_1.default.file.create({
            data: {
                bucketName: req.body.bucketName,
                objectKey: req.body.objectKey,
                content: req.body.content,
                username: req.body.username,
                recordId: req.body.recordId,
            },
        });
        res.status(201).json(file);
    }
    catch (error) {
        res.status(400).json({ error: "Failed to create file" });
    }
});
exports.createFile = createFile;
const generateUploadPresignedUrl = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { bucketName, objectKey, username, content } = req.body;
        const url = yield (0, s3Service_1.generateUploadUrl)(bucketName, `${username}/${content}/${objectKey}`);
        res.json({ url });
    }
    catch (error) {
        res.status(400).json({ error: "Failed to generate upload URL" });
    }
});
exports.generateUploadPresignedUrl = generateUploadPresignedUrl;
const generateDownloadPresignedUrl = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { bucketName, objectKey, username, content } = req.body;
        const url = yield (0, s3Service_1.generateDownloadUrl)(bucketName, `${username}/${content}/${objectKey}`);
        res.json({ url });
    }
    catch (error) {
        res.status(400).json({ error: "Failed to generate download URL" });
    }
});
exports.generateDownloadPresignedUrl = generateDownloadPresignedUrl;
