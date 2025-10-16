import * as crypto from "crypto";

export type Block = {
    index: number;
    timestamp: string;
    transactions: any[];
    previous_hash: string;
    current_hash: string;
};

// hàm kiểm tra tính hợp lệ của block
export function isValidBlock(block: Block): boolean {
    // nối các biến dữ liệu thành chuỗi input cho hash
    const dataToHash = `${block.index}|${block.timestamp}|${JSON.stringify(block.transactions)}|${block.previous_hash}`;
    // tính hash SHA-256 của chuỗi dataToHash
    const computedHash = crypto.createHash('sha256').update(dataToHash).digest('hex');
    // so sánh hash tính được với current_hash của block
    return computedHash === block.current_hash;
}

