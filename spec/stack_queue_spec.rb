require_relative '../stack_queue'

describe StackQueue do
  describe '.new' do
    let(:stack_queue) { StackQueue.new }

    it 'returns an empty stack_queue' do
      expect(stack_queue).to be_empty
    end

    it 'expects the value of tail to be nil' do
      expect(stack_queue.peek).to eq(nil)
    end
  end

  describe '#enqueue' do
    let(:stack_queue) { StackQueue.new }

    it 'increases length of stack_queue by 1' do
      expect {
        stack_queue.enqueue(9)
      }.to change(stack_queue, :size).by(1)
    end

    it 'appends the given value to the stack_queue' do
      expect {
        stack_queue.enqueue(9)
      }.to change(stack_queue, :peek).from(nil).to(9)
    end

    it 'returns the stack_queue itself' do
      expect(stack_queue.enqueue(9)).to eq(stack_queue)
    end

    context 'when stack_queue is empty' do
      let(:stack_queue) { StackQueue.new }

      it 'flags the stack_queue as non-empty' do
        expect {
          stack_queue.enqueue(9)
        }.to change(stack_queue, :empty?).from(true).to(false)
      end
    end
  end

  describe '#dequeue' do
    let(:stack_queue) { StackQueue.new }

    context 'when the stack_queue is non-empty' do
      before { stack_queue.enqueue(9) }

      it 'flags the stack_queue as empty' do
        expect {
          stack_queue.dequeue
        }.to change(stack_queue, :empty?).from(false).to(true)
      end

      it 'decreases length of stack_queue by 1' do
        expect {
          stack_queue.dequeue
        }.to change(stack_queue, :size).by(-1)
      end

      it 'returns the front value in the stack_queue' do
        stack_queue.enqueue(12345)

        expect(stack_queue.dequeue).to eq(9)
      end
    end
  end
end
