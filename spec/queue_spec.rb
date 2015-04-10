require_relative '../queue'

describe Queue do
  describe '.new' do
    let(:queue) { Queue.new }

    it 'returns an empty queue' do
      expect(queue).to be_empty
    end

    it 'expects the value of tail to be nil' do
      expect(queue.list.tail.value).to eq(nil)
    end
  end

  describe '#enqueue' do
    let(:queue) { Queue.new }

    it 'increases length of queue by 1' do
      expect {
        queue.enqueue(9)
      }.to change(queue.list, :length).by(1)
    end

    it 'appends the given value to the queue' do
      expect {
        queue.enqueue(9)
      }.to change { queue.list.tail.value }.from(nil).to(9)
    end

    it 'returns the queue itself' do
      expect(queue.enqueue(9)).to eq(queue.list)
    end

    context 'when queue is empty' do
      let(:queue) { Queue.new }

      it 'flags the queue as non-empty' do
        expect {
          queue.enqueue(9)
        }.to change(queue.list, :empty?).from(true).to(false)
      end
    end
  end

  describe '#dequeue' do
    let(:queue) { Queue.new }

    context 'when the queue is non-empty' do
      before { queue.enqueue(9) }

      it 'flags the queue as empty' do
        expect {
          queue.dequeue
        }.to change(queue.list, :empty?).from(false).to(true)
      end

      it 'decreases length of queue by 1' do
        expect {
          queue.dequeue
        }.to change(queue.list, :length).by(-1)
      end

      it 'returns the front value in the queue' do
        queue.enqueue(12345)

        expect(queue.dequeue).to eq(9)
      end
    end
  end
end
